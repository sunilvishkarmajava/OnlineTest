      function validate()
      {

         if(document.myForm.inputname.value=="")
         {
            alert( "Please provide your Name!");
            document.myForm.inputname.focus();
            return false;
         }
         
         if(document.myForm.Age.value=="")
         {
            alert("Please provide your Age!" );
            document.myForm.Age.focus();
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
          
          if(document.myForm.mobileno.value=="")
              {
              alert("Please Enter your Contect no.");
              document.myForm.mobileno.focus();
              return false;
              }
          if(document.myForm.mobileno.value!="")
          {  
        	  if(document.myForm.mobileno.value.length>20 || document.myForm.mobileno.value.length<6)
        	  {
        	  alert("Password Lenght shoucld not be less then 6 and more then 20!");
              document.myForm.mobileno.focus();
              return false;
        	  }
          }
          
          if(document.myForm.selectedimage.value=="")
              {
              alert("Please Upload Image");
              document.myForm.selectedimage.focus();
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

          return( true );
      }
