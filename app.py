from flask import Flask,render_template,request,session,redirect,url_for,flash

from flask_sqlalchemy import SQLAlchemy

local_server= True
app=Flask(__name__)
app.secret_key="cns"

app.config['SQLALCHEMY_DATABASE_URI']='mysql://root:@localhost/user2'
db=SQLAlchemy(app)


  
class test(db.Model):
    id=db.Column(db.Integer,primary_key=True)
    name=db.Column(db.String(100))

class testing(db.Model):
    id=db.Column(db.Integer,primary_key=True)

class student(db.Model):
    usn=db.Column(db.String,primary_key=True)
    name=db.Column(db.String(20))
    sem=db.Column(db.Integer)
    dept=db.Column(db.String(20))
    email=db.Column(db.String(20))
    phone=db.Column(db.String(50))

class department(db.Model):
    id=db.Column(db.Integer,primary_key=True)
    name=db.Column(db.String(20))
    hod=db.Column(db.String(20))

class attendence(db.Model):
    usn=db.Column(db.String,primary_key=True)
    name=db.Column(db.String(20))
    sa1=db.Column(db.Integer)
    st1=db.Column(db.String(20))
    sa2=db.Column(db.Integer)
    st2=db.Column(db.String(20))
    sa3=db.Column(db.Integer)
    st3=db.Column(db.String(20))
    sa4=db.Column(db.Integer)
    st4=db.Column(db.String(20))
    sa5=db.Column(db.Integer)
    st5=db.Column(db.String(20))
    sa6=db.Column(db.Integer)
    st6=db.Column(db.String(20))


class iamarks(db.Model):
    usn=db.Column(db.String,primary_key=True)
    name=db.Column(db.String(20))
    subid=db.Column(db.Integer)
    subname=db.Column(db.String(20))
    ia1=db.Column(db.String(20))
    ia2=db.Column(db.String(20))
    ia3=db.Column(db.String(20))
    avg=db.Column(db.Integer)

    
class fees(db.Model):
    usn=db.Column(db.String,primary_key=True)
    name=db.Column(db.String(20))
    feesp=db.Column(db.String(20))
    remf=db.Column(db.Integer)

class courses(db.Model):
    courseid=db.Column(db.String,primary_key=True)
    coursename=db.Column(db.String(20))
    assignedprof=db.Column(db.String(20))
    



       






@app.route('/',methods=['GET','POST'])
def index():
    
    return render_template('index.html')


@app.route("/addstudent",methods=['POST','GET'])
def addstudent():
    if request.method=='POST':
        usn=request.form.get('usn')
        name=request.form.get('name')
        sem=request.form.get('sem')
        dept=request.form.get('dept')
        email=request.form.get('email')
        phone=request.form.get('phone')

        query=db.engine.execute(f"INSERT INTO `student` (`usn`,`name`,`sem`,`dept`,`email`,`phone`) VALUES ('{usn}','{name}',{sem},'{dept}','{email}','{phone}')") 

    return render_template('addstudent.html')



@app.route("/adddepartment",methods=['POST','GET'])
def adddepartment():
    if request.method=='POST':
        did=request.form.get('id')
        name=request.form.get('name')
        hod=request.form.get('hod')
        query=db.engine.execute(f"INSERT INTO `department` (`id`,`name`,`hod`) VALUES ('{did}','{name}','{hod}')")
    return render_template('adddepartment.html')


@app.route("/addattendence",methods=['POST','GET'])
def addattendence():
    if request.method=='POST':
        usn=request.form.get('usn')
        name=request.form.get('name')
        sa1=request.form.get('sa1')
        if int(sa1)>75:
            st1="valid"
        else:
            st1="shortage"
        
        sa2=request.form.get('sa2')
        if int(sa2)>75:
            st2="valid"
        else:
            st2="shortage"
        
        sa3=request.form.get('sa3')
        if int(sa3)>75:
            st3="valid"
        else:
            st3="shortage"

        sa4=request.form.get('sa4')
        if int(sa4)>75:
            st4="valid"
        else:
            st4="shortage"

        sa5=request.form.get('sa5')
        if int(sa5)>75:
            st5="valid"
        else:
            st5="shortage"

        sa6=request.form.get('sa6')
        if int(sa5)>75:
            st6="valid"
        else:
            st6="shortage"


        query=db.engine.execute(f"INSERT INTO `attendence` (`usn`,`name`,`sa1`,`st1`,`sa2`,`st2`,`sa3`,`st3`,`sa4`,`st4`,`sa5`,`st5`,`sa6`,`st6`) VALUES ('{usn}','{name}','{sa1}','{st1}','{sa2}','{st2}','{sa3}','{st3}','{sa4}','{st4}','{sa5}','{st5}','{sa6}','{st6}')")
    return render_template('addattendence.html')

    


@app.route("/addiamarks",methods=['POST','GET'])
def addiamarks():
    if request.method=='POST':
        usn=request.form.get('usn')
        name=request.form.get('name')
        subid=request.form.get('subid')
        subname=request.form.get('subname')
        ia1=request.form.get('ia1')
        ia2=request.form.get('ia2')
        ia3=request.form.get('ia3')
        total=(int(ia1)+int(ia2)+int(ia3))/3
        avg=total*0.6
        query=db.engine.execute(f"INSERT INTO `iamarks` (`usn`,`name`,`subid`,`subname`,`ia1`,`ia2`,`ia3`,`avg`) VALUES ('{usn}','{name}',{subid},'{subname}','{ia1}','{ia2}','{ia3}','{avg}')") 

    return render_template('addiamarks.html')



@app.route("/addfeesdetails",methods=['POST','GET'])
def addfeesdetails():
    if request.method=='POST':
        usn=request.form.get('usn')
        name=request.form.get('name')
        feesp=request.form.get('feesp')
        total=35000
        remf=total-int(feesp)
        query=db.engine.execute(f"INSERT INTO `fees` (`usn`,`name`,`feesp`,`remf`) VALUES ('{usn}','{name}','{feesp}','{remf}')")
    return render_template('addfeesdetails.html')    


@app.route("/addcourse",methods=['POST','GET'])
def addcourse():
    if request.method=='POST':
        courseid=request.form.get('courseid')
        coursename=request.form.get('coursename')
        assignedprof=request.form.get('assignedprof')
        
        query=db.engine.execute(f"INSERT INTO `courses` (`courseid`,`coursename`,`assignedprof`) VALUES ('{courseid}','{coursename}','{assignedprof}')")
    return render_template('addcourse.html') 


@app.route("/editstudent/<string:usn>",methods=['POST','GET'])
def editstudent(usn):
    posts=student.query.filter_by(usn=usn).first()
    if request.method=="POST":
        usn=request.form.get('usn')
        name=request.form.get('name')
        sem=request.form.get('sem')
        dept=request.form.get('dept')
        email=request.form.get('email')
        phone=request.form.get('phone')
        query=db.engine.execute(f"UPDATE `student` SET `usn`='{usn}',`name`='{name}',`sem`='{sem}',`dept`='{dept}',`email`='{email}',`phone`='{phone}' WHERE `student`.`usn` = '{usn}'")
        return redirect('/viewstudent')

    
    return render_template('editstudent.html',posts=posts)

@app.route("/deletestudent/<string:usn>",methods=['POST','GET'])

def delete(usn):
    db.engine.execute(f"DELETE FROM `student` WHERE `student`.`usn`='{usn}'")
    flash("Slot Deleted Successful","danger")
    return redirect('/viewstudent')








@app.route("/test")
def test():
    #print("hello")
    try:
        a=testing.query.all()
        return 'My database is Connected'
    except Exception as e:
        return f'My db is not Connected{e}'


@app.route("/viewstudent")
def viewstudent():
    query=db.engine.execute(f"SELECT * FROM `student`") 
    
    return render_template('viewstudent.html',query=query)
    
@app.route("/viewdepartment")
def viewdepartment():
    query=db.engine.execute(f"SELECT * FROM `department`")
    return render_template('viewdepartment.html',query=query)

    
@app.route("/viewattendence")
def viewattendence():
    query=db.engine.execute(f"SELECT * FROM `attendence`")
    return render_template('viewattendence.html',query=query)

@app.route("/viewiamarks")
def viewiamarks():
    query=db.engine.execute(f"SELECT * FROM `iamarks`")
    return render_template('viewiamarks.html',query=query)

@app.route("/viewfeesdetails")
def viewfeesdetails():
    query=db.engine.execute(f"SELECT * FROM `fees`")
    return render_template('viewfeesdetails.html',query=query)

@app.route("/viewcourses")
def viewcourses():
    query=db.engine.execute(f"SELECT * FROM `courses`")
    return render_template('viewcourses.html',query=query)

@app.route("/about")
def about():
    
    return render_template('about.html') 





if __name__=="__main__":
    app.run(debug=True)
