      function validate()
      {

         if(document.changepwdform.oldpwd.value=="")
         {
            alert("Enter your Old Password!" );
            document.myForm.oldpwd.focus();
            return false;
         }
          if(document.changepwdform.newpwd.value=="")
         {
            alert("Enter your New Password!" );
            document.myForm.cnewpwd.focus();
            return false;
         }
          if(document.changepwdform.cnewpwd.value=="")
            {
            alert( "Enter to Confirm Password!");
            document.changepwdform.cnewpwd.focus();
            return false;
            }
          if(document.changepwdform.newpwd.value!="")
              {
          if(document.changepwdform.newpwd.value!=document.changepwdform.cnewpwd.value)
              {
               alert("Password Dose not match!");
               document.changepwdform.cnewpwd.focus();
                return false;
              }
            }
          return( true );
      }
