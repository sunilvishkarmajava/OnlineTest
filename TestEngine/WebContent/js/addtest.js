function validate()
{
    if(document.addtest.faculty_id.value=="")
              {
              alert("Please Select the Faculty ID");
              document.addtest.faculty_id.focus();
              return false;
              }
    
    if(document.addtest.course_id.value=="")
              {
              alert("Please Select the Course ID");
              document.addtest.course_id.focus();
              return false;
              }
    
    if(document.addtest.testname.value=="")
              {
              alert("Please Enter the Test name");
              document.addtest.testname.focus();
              return false;
              }

    if(document.addtest.testtime.value=="")
         {
            alert( "Please Provide the test Duration");
            document.addtest.testtime.focus();
            return false;
         }
    if(document.addtest.minmarks.value=="")
         {
            alert( "Please Enter the Mimimun Marks");
            document.addtest.minmarks.focus();
            return false;
         }
    if(document.addtest.totalmarks.value=="")
         {
            alert( "Please Enter the Mimimun Marks");
            document.addtest.totalmarks.focus();
            return false;
         }
    if(document.addtest.testquestion.value=="")
    {
        alert("Please Add the Question ");
        document.addtest.testquestion.focus();
        return false;
    }

    /*if(document.addtest.testquestion.value=="")
    {
        alert( "Please Add the Question ");
        document.addtest.testquestion.focus();
        return false;
    }*/

    if(document.addtest.a.value=="")
    {
        alert("Please Provide Option A");
        document.addtest.a.focus();
        return false;
    }

    if(document.addtest.b.value=="")
    {
        alert("Please Provide Option B");
        document.addtest.b.focus();
        return false;
    }

    if(document.addtest.c.value=="")
    {
        alert("Please Provide Option C");
        document.addtest.c.focus();
        return false;
    }

    if(document.addtest.d.value=="")
    {
        alert( "Please Provide Option D");
        document.addtest.d.focus();
        return false;
    }

    if(document.addtest.correct_answer.value=="")
    {
        alert( "Please Provide Correct Answer of the Question");
        document.addtest.correct_answer.focus();
        return false;
    }
    return(true);
}