<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-group input[type="radio"] {
            width: auto;
            margin-right: 10px;
        }
        .form-group .radio-group {
            display: flex;
            align-items: center;
        }
        .form-group .radio-group label {
            margin-right: 20px;
        }
        .form-group select {
            padding: 8px;
        }
        .form-group input[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            cursor: pointer;
            padding: 12px;
            font-size: 16px;
            border-radius: 4px;
        }
        .form-group input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Registration Form</h2>
        <form action="regForm" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name1" required />
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email1" required />
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="pass1" required />
            </div>
            <div class="form-group">
                <label>Gender:</label>
                <div class="radio-group">
                    <input type="radio" id="male" name="gender1" value="Male" required />
                    <label for="male">Male</label>
                    <input type="radio" id="female" name="gender1" value="Female" required />
                    <label for="female">Female</label>
                </div>
            </div>
            <div class="form-group">
                <label for="city">City:</label>
                <select id="city" name="city1" required>
                    <option value="">Select City</option>
                    <option value="Delhi">Delhi</option>
                    <option value="Mumbai">Mumbai</option>
                    <option value="Kolkata">Kolkata</option>
                    <option value="Bangalore">Bangalore</option>
                    <option value="Chennai">Chennai</option>
                    <option value="Hyderabad">Hyderabad</option>
                    <option value="Pune">Pune</option>
                    <option value="Ahmedabad">Ahmedabad</option>
                    <option value="Surat">Surat</option>
                    <option value="Jaipur">Jaipur</option>
                    <option value="Lucknow">Lucknow</option>
                    <option value="Kanpur">Kanpur</option>
                    <option value="Nagpur">Nagpur</option>
                    <option value="Indore">Indore</option>
                    <option value="Bhopal">Bhopal</option>
                    <option value="Patna">Patna</option>
                    <option value="Vadodara">Vadodara</option>
                    <option value="Vijayawada">Vijayawada</option>
                    <option value="Coimbatore">Coimbatore</option>
                    <option value="Mangalore">Mangalore</option>
                    <option value="Nashik">Nashik</option>
                    <option value="Amritsar">Amritsar</option>
                    <option value="Agra">Agra</option>
                    <option value="Thane">Thane</option>
                    <option value="Gurgaon">Gurgaon</option>
                    <option value="Noida">Noida</option>
                    <option value="Rajkot">Rajkot</option>
                    <option value="Jabalpur">Jabalpur</option>
                    <option value="Bhubaneswar">Bhubaneswar</option>
                    <option value="Dehradun">Dehradun</option>
                    <option value="Shimla">Shimla</option>
                    <option value="Shillong">Shillong</option>
                    <option value="Kochi">Kochi</option>
                    <option value="Trivandrum">Trivandrum</option>
                    <option value="Udaipur">Udaipur</option>
                    <option value="Aurangabad">Aurangabad</option>
                    <option value="Raipur">Raipur</option>
                    <option value="Gwalior">Gwalior</option>
                    <option value="Jodhpur">Jodhpur</option>
                    <option value="Kakinada">Kakinada</option>
                    <option value="Warangal">Warangal</option>
                    <option value="Ranchi">Ranchi</option>
                    <option value="Dhanbad">Dhanbad</option>
                    <option value="Bhilai">Bhilai</option>
                    <option value="Jamshedpur">Jamshedpur</option>
                    <option value="Siliguri">Siliguri</option>
                    <option value="Guwahati">Guwahati</option>
                </select>
            </div>
            <div class="form-group">
                <input type="submit" value="Register" />
            </div>
        </form>
    </div>
</body>
</html>
