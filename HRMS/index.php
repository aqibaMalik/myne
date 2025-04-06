<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Human Resource Management System</title>
    <link rel="stylesheet" href="styles.css">
    
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"> -->
  </style>
</head>
<body class="bg-secondary bg-gradient">
    <nav class="" data-bs-theme="dark">
        <div class="container-fluid">
            <span class="navbar-brand mb-0 h1">Human Resource Management System</span>
        </div>
    </nav>
    <main class="container success text-center">
        <form method="get" action="">
            <select name="gender" id="">
                <option value="">Gender</option>
                <option value="M">Male</option>
                <option value="F">Female</option>
            </select>
            <select name="age" id="">
                <option value="0 AND 100">Age is Between</option>
                <option value="20 AND 30">20 AND 30</option>
                <option value="30 AND 40">30 AND 40</option>
                <option value="40 AND 50">40 AND 50</option>
                <option value="50 AND 60">50 AND 60</option>
                <option value="60 AND 70">60 AND 70</option>
            </select>
            <input type="text" name="name" placeholder="Name Initials">
            <select name="occupation" id="">
                <option value="">Occupation</option>
                <option value="surgeon">surgeon</option>
                <option value="pharmacist">pharmicist</option>
                <option value="teacher">teacher</option>
                <option value="lecturer">lecturer</option>
                <option value="master">master</option>
                <option value="physician">physician</option>
                <option value="field assistant">field assistant</option>
            </select>
            <select name="salary" id="">
                <option value="0">Salary greater than</option>
                <option value="3000">3000</option>
                <option value="5000">5000</option>
                <option value="7000">7000</option>
                <option value="8000">8000</option>
                <option value="9000">9000</option>
            </select>
            <div class="search">
                <button type="submit" name="search">
                <i class="fa-solid fa-magnifying-glass"></i>
                </button>
            </div>
    </form>
    
    <section>
        <table class="table table-success table-striped">
                <tr> <th>ID</th> <th>First Name</th> <th>Mid-Name</th> <th>Sur-name</th> <th>Address</th> <th>Aadhar</th> <th>Designation</th> <th>Salary</th> <th>DOB</th><th>Gender</th> <th>Deptt Id</th> <th>Manager</th></tr>
                <?php
                      $mysqli = mysqli_connect("localhost", "root", "", "HRM_DDL_DML_MYSQL");
                      if ($mysqli->connect_error) {
                          die('Connect Error (' .
                          $mysqli->connect_errno . ') '.
                          $mysqli->connect_error);
                      }
                if(isset($_GET["search"])){
                    $salary = $_GET["salary"];
                    $desig = $_GET["occupation"];
                    $gender = $_GET["gender"];
                    $Age = $_GET["age"];
                    $name = $_GET["name"];
                   
                    // echo $name;
                    // echo $Age;
                    // echo $salary;
                    // echo $desig;
                    // AND desig = $desig AND gender = $gender
                    // AND DATEDIFF(CURDATE(), dob) / 365 BETWEEN $Age 
                    //PUTTING CONDITIONS FOR ALL DEFAULT VALUES OF GENDER AND OCCUPATION//

                        $sql = "SELECT * FROM employee WHERE salary > $salary";

                        if ($desig !== "") {
                            $sql .= " AND desig = '$desig'";
                        }
                        
                        if ($gender !== "") {
                            $sql .= " AND gender = '$gender'";
                        }
                        
                        if ($Age !== "") {
                            $sql .= " AND DATEDIFF(CURDATE(), dob) / 365 BETWEEN $Age";
                        }
                        
                        if ($name !== "") {
                            $sql .= " AND fname LIKE '%$name%'";
                        }
                        
                
                $result = $mysqli->query($sql);
                if($result->num_rows == 0){
                    die("<strong style='color: red'>No Records Found</strong>");
                }
               
                while($row = $result->fetch_assoc()) {
                    
                ?>
                <tr>
                    <td><?php echo $row['id'];?></td>
                    <td><?php echo $row['fname'];?></td>
                    <td><?php echo $row['mname'];?></td>
                    <td><?php echo $row['sname'];?></td>
                    <td><?php echo $row['address'];?></td>
                    <td><?php echo $row['adhar_no'];?></td>
                    <td><?php echo $row['desig'];?></td>
                    <td><?php echo $row['salary'];?></td>
                    <td><?php echo $row['dob'];?></td>
                    <td><?php echo $row['gender'];?></td>
                    <td><?php echo $row['deptt_id'];?></td>
                    <td><?php echo $row['mgr_id'];?></td>
                </tr>
                <?php
                }
            }
                $mysqli->close();
        
                ?>
            </table>
        </section>
    </main>
    <script src="https://kit.fontawesome.com/d02f55c382.js" crossorigin="anonymous"></script>
</body>
</html>
