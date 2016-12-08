      function validate()
      {
         if(document.myForm.teachername.value=="")
         {
            alert( "Please provide your Name!");
            document.myForm.teachername.focus();
            return false;
         }
         
         if(document.myForm.age.value=="")
         {
            alert("Please provide your Age!" );
            document.myForm.age.focus();
            return false;
         }
          
         var emailID = document.myForm.email.value;
          
          if(emailID=="")
              {
                alert("Please provide your Email ID!" );
                document.myForm.email.focus();
                return false
              }
          
          if(emailID!="")
              {
                  atpos = emailID.indexOf("@");
                  dotpos = emailID.lastIndexOf(".");
         
                if (atpos < 1 || ( dotpos - atpos < 2 )) 
                    {
                    alert("Please enter correct email ID")
                    document.myForm.email.focus() ;
                    return false;
                    }
              }
          
         if(document.myForm.password.value=="")
            {
            alert("Please Enter your Password!");
            document.myForm.password.focus();
            return false;
            }
          
         if(document.myForm.confirmpassword.value=="")
            {
            alert( "Please Enter your Password Again!" );
            document.myForm.confirmpassword.focus();
            return false;
            }
          
          if(document.myForm.confirmpassword.value!="")
              {
          if(document.myForm.password.value!=document.myForm.confirmpassword.value)
              {
               alert("Password Dose not match!");
               document.myForm.confirmpassword.focus();
                return false;
              }
            }
          
          if(document.myForm.phone.value=="")
              {
              alert("Please Enter your Contect no.");
              document.myForm.phone.focus();
              return false;
              }
          
         
         if(document.myForm.address.value=="")
            {
            alert( "Please Enter your Address");
            document.myForm.address.focus();
            return false;
            }
          
         if(document.myForm.institute.value=="")
              {
              alert( "Please Enter your institute Name");
              document.myForm.institute.focus();
              return false;
              }

          if(document.myForm.teacherimage.value=="")
              {
              alert("Please Upload Image");
              document.myForm.teacherimage.focus();
              return false;
              }

          return( true );
      }
