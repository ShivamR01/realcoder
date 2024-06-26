from flask import Flask,request,render_template,session,redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
import os
import math
# from werkzeug.utils import secure_filename
# from werkzeug.datastructures import  FileStorage


with open('config.json','r') as c:
    params=json.load(c)["params"]
   

local_server=True
app=Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER']=params['upload_location']
if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']



# Creating an SQLAlchemy instance
db = SQLAlchemy(app)


class Contact(db.Model):
    __tablename__ = "contact"
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phone= db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(20), nullable=False)


class Posts(db.Model):
    __tablename__ = "posts"
    Sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    tagline = db.Column(db.String(80), nullable=False)
    name = db.Column(db.String(80), nullable=False)
    slug= db.Column(db.String(25), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(15), nullable=True)




@app.route("/")
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['no_of_posts']))
    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[(page-1)*int(params['no_of_posts']):(page-1)*int(params['no_of_posts'])+ int(params['no_of_posts'])]
    if page==1:
        prev = "/"
        next = "/?page="+ str(page+1)
    elif page==last:
        prev = "/?page="+ str(page-1)
        next = ""
    else:
        prev = "/?page="+ str(page-1)
        next = "/?page="+ str(page+1)
    
    return render_template('index.html', params=params, posts=posts, prev=prev, next=next)





@app.route("/about")
def about():
    return render_template("about.html",params=params)
@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if(request.method=='POST'):
        name=request.form.get('name')
        email=request.form.get('email')
        phone=request.form.get('phone')
        message=request.form.get('message')
        date=request.form.get('date')
        entry = Contact(name=name, phone= phone, msg = message,email = email,date=datetime.now() )
        db.create_all()
        db.session.add(entry)
        db.session.commit()
        return render_template("contact.html",data = "submitted",params=params)
    return render_template("contact.html",params=params)

@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    posts= Posts.query.filter_by(slug=post_slug).first()
    return render_template("post.html",params=params,post=posts)


@app.route("/allpost", methods=['GET'])
def allpost():
    post= Posts.query.filter_by().all()
    return render_template("allpost.html",params=params,post=post)

@app.route("/dashboard",methods=['GET','POST'])
def dashboard():
    if ("user" in session and session['user']==params['admin_user']):
        posts=Posts.query.all()
        entry=Contact.query.all()
        return render_template("dashboard.html",params=params,posts=posts,entry=entry)
    
    if (request.method=='POST'):
        username=request.form.get('uname')
        userpass=request.form.get('pass')
        if(username==params['admin_user'] and userpass==params['admin_pass']):
            session['user']=username
            posts=Posts.query.all()
            entry=Contact.query.all()
            return render_template("dashboard.html",params=params,posts=posts,entry=entry)

    return render_template("login.html",params=params)

@app.route("/data")
def data():
    return render_template("data.html",params=params)

@app.route("/edit/<string:sno>",methods=['GET','POST'])
def edit(sno):
    if ("user" in session and session['user']==params['admin_user']):
        if (request.method=="POST"):
            box_title = request.form.get('title')
            tline = request.form.get('tline')
            name = request.form.get('name')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()

            if sno=="0":
                post = Posts(title=box_title, slug=slug, content=content, tagline=tline, name=name,img_file=img_file, date=date)
                db.create_all()
                db.session.add(post)
                db.session.commit()
            else:
                post=Posts.query.filter_by(Sno=sno).first()
                post.title=box_title
                post.slug=slug
                post.name=name
                post.content=content
                post.tagline=tline
                post.img_file=img_file
                post.date=date
                db.session.commit()
                return redirect('/dashboard')
                # return redirect('/edit/'+sno)
        post=Posts.query.filter_by(Sno=sno).first()
        return render_template('edit.html', params=params,post=post,sno=sno)
    
@app.route("/logout")    
def logout():
    session.pop('user')
    return redirect('/')


@app.route("/delete/<string:sno>")    
def delete(sno):
    if ("user" in session and session['user']==params['admin_user']):
        post=Posts.query.filter_by(Sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')
#delete contact message
@app.route("/deletemsg/<string:sno>")    
def delete_msg(sno):
    if ("user" in session and session['user']==params['admin_user']):
        entry=Contact.query.filter_by(sno=sno).first()
        db.session.delete(entry)
        db.session.commit()
    return redirect('/dashboard')

# @app.route("/userlogin")
# def userlogin():
#     return "Feature coming soon"

@app.route("/addpost",methods=['GET','POST'])
def addpost():  
    if ("user" in session and session['user']==params['user_user']):
        posts=Posts.query.all()
        return render_template("addpost.html",params=params,posts=posts)
    
    if (request.method=='POST'):
        username=request.form.get('username')
        userpass=request.form.get('userpass')
        if(username==params['user_user'] and userpass==params['user_pass']):
            session['user']=username
            posts=Posts.query.all()
            return render_template("addpost.html",params=params,posts=posts)

    return render_template("userlogin.html",params=params)
# @app.route("/logout1")    
# def user_logout():
#     session.pop('user')
#     return redirect('/')
@app.route("/add/<string:sno>",methods=['GET','POST'])
def add(sno):
    if ("user" in session and session['user']==params['user_user']):
        if (request.method=="POST"):
            box_title = request.form.get('title')
            tline = request.form.get('tline')
            name = request.form.get('name')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()

            if sno=="0":
                post = Posts(title=box_title, slug=slug, content=content, tagline=tline, name=name,img_file=img_file, date=date)
                db.create_all()
                db.session.add(post)
                db.session.commit()
                return redirect('/addpost')
        post=Posts.query.filter_by(Sno=sno).first()
        return render_template('add.html', params=params,post=post,sno=sno)    

# @app.route("/uploader",method=['GET','POST'])
# def uploader():
#     if ("user" in session and session['user']==params['admin_user']):
#         if (request.method=="POST"):
#             f=request.files['file1']
#             f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
#             return "uploaded successfully"
                

app.run(debug=True)