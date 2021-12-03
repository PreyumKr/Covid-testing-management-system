<?php
// import phpmailer classes
use PHPMailer\PHPMailer\PHPMailer;
// use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

// Load composer autoload
require 'vendor/autoload.php';

session_start();
include('includes/config.php');

if(isset($_POST["OTP"]))
{
    $email=$_POST['email'];
    $username=$_POST['username'];
    $contactno=$_POST['contactno'];
    $query=mysqli_query($con,"select ID from tbladmin where  Adusername='$username' and Email='$email' ");
    $ret=mysqli_num_rows($query);
    if($ret>0)
    {
    $mail = new PHPMailer(true);
    try{
        $mail->SMTPDebug = 0;
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = 'covidtmsservice@gmail.com';
        $mail->Password = '@#Covid196729';
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = 587;
        $mail->setFrom('covidtmsservice@gmail.com','Covid-19 TMS');
        $mail->addAddress($email,"Admin Covid-TMS");
        $mail->isHTML(true);
        $OTP = substr(number_format(time() * rand(), 0, '', ''), 0, 6);
        $mail->Subject = 'Email Verification';
        $mail->Body = '<p>Your verification code is: <b style="font-size: 30px;">'.$OTP. '</b></p>';
        $mail->send();
        $query="update tbladmin set OTP='$OTP' where Adusername='$username' and Phno='$contactno'";
        $result =mysqli_query($con, $query);
        if ($result) {
        echo '<script>alert("OTP Sent!")</script>';}
    }catch(Exception $e){
        echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
    }
    }
    else
    echo '<script>alert("Email does not belong to any admin!")</script>';
}



if(isset($_POST['submit']))
{
$contactno=$_POST['contactno'];
$username=$_POST['username'];
$otpp=$_POST['OTPvalue'];
$password=md5($_POST['newpassword']);
$query=mysqli_query($con,"select ID from tbladmin where  Adusername='$username' and Phno='$contactno' and OTP='$otpp' ");
        
    $ret=mysqli_num_rows($query);
    if($ret>0){
      $query1=mysqli_query($con,"update tbladmin set Password='$password'  where  Adusername='$username' && Phno='$contactno' ");
       if($query1)
   {
echo "<script>alert('Password successfully changed!');</script>";
echo "<script>window.location.href='login.php'</script>";

   }
    }
    else{
    
      echo "<script>alert('Invalid Details. Please try again.');</script>";
    }
  }
  ?>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Covid 19 Testing Management System | Admin Login</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
  <script type="text/javascript">
function checkpass()
{
if(document.changepassword.newpassword.value!=document.changepassword.confirmpassword.value)
{
alert('New Password and Confirm Password field does not match');
document.changepassword.confirmpassword.focus();
return false;
}
return true;
} 

</script>
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">
 <h3 align="center" style="margin-top:4%;color:#fff">Covid-19 Testing Management System</h3>
                <div class="card o-hidden border-0 shadow-lg my-5">

                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
<form name="login" method="post" name="changepassword">
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Password Recovery</h1>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="username" 
                                                id="username" placeholder="Enter username" required="true" value="<?php echo (isset($_POST['username']) ? htmlspecialchars($_POST['username']):'');?>">
                                        </div>
                                        <div class="form-group">
                                <input type="text" name="contactno" placeholder="Contact Number" autocomplete="off" class="form-control" value="<?php echo (isset($_POST['contactno']) ? htmlspecialchars($_POST['contactno']):'');?>">
                                        </div>
                                        <div class="form-group">
                                <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control" value="<?php echo (isset($_POST['email']) ? htmlspecialchars($_POST['email']):'');?>">
                                        </div>
                                        <div class="form-group">
                                        <input type="submit" name="OTP" class="btn btn-primary btn-user btn-block" value="Send OTP on Email" >
                                        </div>

                                    <div class="form-group">
                                      <input type="password" name="newpassword" placeholder="New Password" autocomplete="off" class="form-control">
                                        </div>

                                            <div class="form-group">
                               <input type="password" name="confirmpassword" placeholder="Confirm Password" autocomplete="off" class="form-control">
                                        </div>
                                        <div class="form-group">
                                <input type="text" name="OTPvalue" placeholder="6 Digit OTP" autocomplete="off" class="form-control">
                                        </div>

                        <input type="submit" name="submit" class="btn btn-primary btn-user btn-block" value="Submit">
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="login.php" style="font-weight:bold">Signin</a>
                                    </div>
                               <div class="text-center">
                                        <a class="small" href="index.php" style="font-weight:bold;"><i class="fa fa-home" aria-hidden="true"></i> Home Page</a>
                                    </div>
                                </div>
                            </div>
                        </div>

</form>

                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>

</html>