namespace :database do
    require 'pg'                                                                                # <--- Requires the postgreSQL gem (Since we're connecting to a postgreSQL server).
    require 'faker'
    require 'json'
# To connect to a remote database (postgreSQL in our case).
# postgreSQL = PG.connect( 
#     dbname: 'FrancisRenauld', 
#     host: 'codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com', 
#     user: 'codeboxx',
#     password: 'Codeboxx1!'
# )
# To both delete all the DATA inside the mySQL database and "Re-Populate" it with newly generated fake DATA.
    task mysql: [
        :empty_mysql, 
        :fake,
    ]
# Delete the DATA inside the mySQL database.
    task :empty_mysql => :environment do
        Elevator.destroy_all
        Column.destroy_all
        Battery.destroy_all
        Employee.destroy_all
        BuildingDetail.destroy_all
        Building.destroy_all
        Customer.destroy_all
        User.destroy_all
        Address.destroy_all
    end
# Generate fake DATA used to test the databases and code.
    task :fake => :environment do   
        data = JSON.parse(File.read(Rails.root.join('lib','addresses.json')))
        date1 = Faker::Date.between(from: '2019-01-01', to: '2022-05-18')

        allUser = Array[

        user = User.create!(
            admin: true,
            email: "mathieu.houde@codeboxx.biz",
            password: "Password123",
            created_at: date1,
            updated_at: date1,
        ),

        user = User.create!(
            admin: true,
            email: "patrick.thibault@codeboxx.biz",
            password: "Password123",
            created_at: date1,
            updated_at: date1,
        ),

        user = User.create!(
            admin: true,
            email: "francis.patry-jessop@codeboxx.biz",
            password: "Password123",
            created_at: date1,
            updated_at: date1,
        ),

        user = User.create!(
            admin: true,
            email: "david.amyot@codeboxx.biz",
            password: "Password123",
            created_at: date1,
            updated_at: date1,
        ),

        user = User.create!(
            admin: true,
            email: "marie-eve.goupil@codeboxx.biz",
            password: "Password123",
            created_at: date1,
            updated_at: date1,
        ),

        user = User.create!(
            admin: true,
            email: "francois.boivin@codeboxx.biz",
            password: "Password123",
            created_at: date1,
            updated_at: date1,
        ),

        user = User.create!(
            admin: true,
            email: "timothy.wever@codeboxx.biz",
            password: "Password123",
            created_at: date1,
            updated_at: date1,
        ),

        user = User.create!(
            admin: true,
            email: "kiril.kleinerman@codeboxx.biz",
            password: "Password123",
            created_at: date1,
            updated_at: date1,
        ),

        user = User.create!(
            admin: true,
            email: "felicia.hartono@codeboxx.biz",
            password: "Password123",
            created_at: date1,
            updated_at: date1,
        ),

        user = User.create!(
            admin: true,
            email: "eileen.ai@codeboxx.biz",
            password: "Password123",
            created_at: date1,
            updated_at: date1,
        )]

            allEmployee = Array[

        employee = Employee.create!(
            user: allUser[0],
            First_Name: "Mathieu",
            Last_Name: "Houde",
            Title_Or_Function: 'Gopher',
            Email: "mathieu.houde@codeboxx.biz",
        ),

        employee = Employee.create!(
            user: allUser[1],
            First_Name: "Patrick",
            Last_Name: "Thibault", 
            Title_Or_Function: "Maximalist",
            Email: "patrick.thibault@codeboxx.biz",
        ),

        employee = Employee.create!(
            user: allUser[2],
            First_Name: "Francis",
            Last_Name: "Patry-Jessop",
            Title_Or_Function: "aptain",
            Email: "francis.patry-jessop@codeboxx.biz",
        ),

        employee = Employee.create!(
            user: allUser[3],
            First_Name: "David",
            Last_Name: "Amyot",
            Title_Or_Function: "The Man	",
            Email: "david.amyot@codeboxx.biz",
        ),

        employee = Employee.create!(
            user: allUser[4],
            First_Name: "Marie-Ève",
            Last_Name: "Goupil",
            Title_Or_Function: "AI Master",
            Email: "marie-eve.goupil@codeboxx.biz",
        ),

        employee = Employee.create!(
            user: allUser[5],
            First_Name: "François",
            Last_Name: "Boivin",
            Title_Or_Function: "The Tank",
            Email: "francois.boivin@codeboxx.biz",
        ),

        employee = Employee.create!(
            user: allUser[6],
            First_Name: "Timothy",
            Last_Name: "Wever",
            Title_Or_Function: "Beard whisperer",
            Email: "timothy.wever@codeboxx.biz",
        ),

        employee = Employee.create!(
            user: allUser[7],
            First_Name: "Kiril",
            Last_Name: "Kleinerman",
            Title_Or_Function: "I <3 Winnipeg",
            Email: "kiril.kleinerman@codeboxx.biz",
        ),

        employee = Employee.create!(
            user: allUser[8],
            First_Name: "Felicia",
            Last_Name: "Hartono",
            Title_Or_Function: "Scrums are too early",
            Email: "felicia.hartono@codeboxx.biz",

        ),

        employee = Employee.create!(
            user: allUser[9],
            First_Name: "Eileen",
            Last_Name: "Ai",
            Title_Or_Function: "They really are.",
            Email: "eileen.ai@codeboxx.biz",
        )]

        data["addresses"].each do |address|
            sameEmail = Faker::Internet.email
            date = Faker::Date.between(from: '2019-01-01', to: '2022-05-18')
            cbe = Faker::Date.between(from: '2019-01-01', to: '2022-05-18')

            user = User.create!(
                admin: false,
                email: sameEmail,
                password: "Password123",
                created_at: date,
                updated_at: date,
            )

            address_obj = Address.create!(
                Type_Of_Address:["business", "billing", "shipping", "home"].sample,
                Status: ["active", "inactive"].sample,
                Entity: ["customer", "building"].sample,
                Number_And_Street: address["address1"],
                Suite_Or_Apartment: ("lorem ipsum"),
                City: address["city"].gsub(/\W/, ''),
                Postal_Code: address["postalCode"],
                Lat: address["lat"],
                Lng: address["lng"],
                Country: ("US"),
                Notes: ("lorem ipsum"),
                created_at: date,
                updated_at: date,
            )

            customer = Customer.create!(
                address: address_obj,
                user: user,
                Company_Name: Faker::Company.name,
                Company_Headquarters_Adress: address["address1"],
                Full_Name_Of_The_Company_Contact: Faker::Name.name,
                Company_Contact_Phone: Faker::PhoneNumber.phone_number,
                Email_Of_The_Company_Contact: sameEmail,         
                Company_Description: "lorem ipsum",
                Full_Name_Of_Service_Technical_Authority: Faker::Name.name,
                Technical_Authority_Phone_For_Service: Faker::PhoneNumber.phone_number,
                Technical_Manager_Email_For_Service: Faker::Internet.email,
                created_at: date,
                updated_at: date,
            )

        nbTime3 = Faker::Number.between(from: 1, to: 2)
        nbTime3.times do
            building = Building.create!(
                customer: customer,
                address: address_obj,
                Full_Name_Of_The_Building_Administrator: Faker::Name.name,
                Email_Of_The_Administrator_Of_The_Building: Faker::Internet.email,
                Phone_Number_Of_The_Building_Administrator: Faker::PhoneNumber.phone_number,
                Full_Name_Of_The_Technical_Contact_For_The_Building: Faker::Name.name ,
                Technical_Contact_Email_For_The_Building:  Faker::Internet.email,
                Technical_Contact_Phone_For_The_Building: Faker::PhoneNumber.phone_number,
                created_at: date,
                updated_at: date,

            )
            

            buildingD = BuildingDetail.create!(
                building: building,
                Information_Key: "nbOfFloors",
                Value: Faker::Number.between(from: 1, to: 150),
                created_at: date,
                updated_at: date,
            )

        nbTime = Faker::Number.between(from: 1, to: 2)

            nbTime.times do
            battery = Battery.create!(
                employee: allEmployee.sample,
                building: building,
                Type: ["Résidentiel", "Commercial", "Corporatif", "Hybride"].sample,
                Status: ["Active" , "Inactive", "Intervention"].sample,
                Date_Of_Commissioning: Faker::Date.between(from: '2019-01-01', to: '2022-05-18'),
                Date_Of_Last_Inspection: Faker::Date.between(from: '2019-01-01', to: '2022-05-18'),
                Certificate_Of_Operations: "lorem ipsum",
                Information: "lorem ipsum",
                Notes: "lorem ipsum",
                created_at: cbe,
                updated_at: cbe,
            )

            nbTime1 = Faker::Number.between(from: 1, to: 2)
            nbTime1.times do

                column = Column.create!(
                    battery: battery,
                    Type:["Résidentiel", "Commercial", "Corporatif"].sample,
                    Number_Of_Floors_Served: Faker::Number.between(from: 1, to: 150),
                    Status: ["Active" , "Inactive", "Intervention"].sample,
                    Information: "lorem ipsum",
                    Notes: "lorem ipsum",
                    created_at: cbe,
                    updated_at: cbe,
                )
                
                nbTime2 = Faker::Number.between(from: 1, to: 2)
                nbTime2.times do

                    elevator = Elevator.create!(
                        column: column,
                        Serial_Number:Faker::Number.number(digits: 7),
                        Model: ["Standard", "Premium", "Excelium"].sample,
                        Type: ["Résidentiel", "Commercial", "Corporatif"].sample,
                        Status: ["Active" , "Inactive", "Intervention"].sample,
                        Date_Of_Commissioning: Faker::Date.between(from: '2019-01-01', to: '2022-05-18'),
                        Date_Of_Last_Inspection: Faker::Date.between(from: '2019-01-01', to: '2022-05-18'),
                        Certificate_Of_Inspection: "lorem ipsum",
                        Information: "lorem ipsum",
                        Notes: "lorem ipsum",
                        created_at: cbe,
                        updated_at: cbe,
                    )
                    end
                end
            end
        end

            lead = Lead.create!(
                Full_Name_Of_The_Contact: Faker::Name.name,
                Company_Name: Faker::Company.name,
                Email: Faker::Internet.email,
                Phone: Faker::PhoneNumber.phone_number,
                Project_Name: "lorem ipsum",
                Project_Description: "lorem ipsum",
                Departement_In_Charge_Of_The_Elevators:["Residential", "Corporate", "Commercial", "Hybrid"].sample,
                Message: "lorem ipsum",
                created_at: Faker::Date.between(from: '2019-01-01', to: '2022-07-18'),
            )

            nbElev = Faker::Number.between(from: 2, to: 30)
            date4 = Faker::Date.between(from: '2016-01-01', to: '2019-07-18')

            quote = Quote.create!(
                Building_Type:["Residential","Corporate","Commercial", "Hybrid"].sample,
                Number_of_apartments:Faker::Number.between(from: 1, to: 500),
                Number_of_floors: Faker::Number.between(from: 1, to: 150),
                Number_of_basements: Faker::Number.between(from: 1, to: 10),
                Number_of_separate_companies: Faker::Number.between(from: 1, to: 20),
                Email: Faker::Internet.email,
                Company_Name: Faker::Company.name,
                Number_of_parking_spaces: Faker::Number.between(from: 1, to: 125),
                Maximum_Number_Of_Occupants_Per_Floor: Faker::Number.between(from: 1, to: 50),
                Number_Of_Dstinct_Businesses: Faker::Number.between(from: 1, to: 20),
                Number_Of_Elevators_Needed: nbElev,
                Number_Of_Hours_Of_Activity_Of_The_Building: Faker::Number.between(from: 8, to: 24),
                Type_Of_Installation: ["Standard", "Premium", "Excelium"].sample,
                Amount_Of_Elevators_Needed: nbElev,
                Elevator_Unit_Price: [7565, 12345, 15400].sample,
                Elevator_Total_Price:  Faker::Number.between(from: 16000, to: 500000),
                Installation_Fees: Faker::Number.between(from: 5000, to: 75000),
                Final_Price: Faker::Number.between(from: 21000, to: 575500),
                created_at: date4,
                updated_at: date4,
            )

        end
    end
# To run all the tasks inside the array in the order used in the array to drop all the tables, create all the tables and populate them.
    task run: [
        :Drop_Tables, 
        :create_psql_tables,
        :populate_psql_tables
    ]                                       
 # To run all the tasks inside the array in the order used in the array to create the tables in postgreSQL.
    task create_psql_tables: [
        :Create_FactQuotes_Table, 
        :Create_FactContact_Table, 
        :Create_FactElevator_Table, 
        :Create_DimCustomers_Table, 
        :Create_FactIntervention_Table,
    ]
# To run all the tasks inside the array in the order used in the array to populate the tables in postgreSQL.
    task populate_psql_tables: [
        :Send_Data_To_FactQuotes, 
        :Send_Data_To_FactContact, 
        :Send_Data_To_FactElevator,
        :Send_Data_To_DimCustomers,
        :Send_Data_To_FactIntervention,
        
    ]
 # Tests if the connection is established with the database and should print the name of the database your connected to.
    task :test_connection do                                                                   
        puts "-------------------------------"
        puts postgreSQL.db
        puts "-------------------------------"
    end
     # Drops the table on the databases mentioned below
    task :Drop_Tables do                                                                   
        postgreSQL.exec("DROP TABLE IF EXISTS FactQuotes, FactContact, FactElevator, DimCustomers,FactIntervention;")
    end
    # Creates a new table and execute the code in the database you're connected to, add the new table inside that database named FactQuotes.
    task :Create_FactQuotes_Table do                                                                  
        postgreSQL.exec("CREATE TABLE FactQuotes
            (
            QuoteId BIGINT PRIMARY KEY NOT NULL,  
            Creation TIMESTAMP, 
            Company_Name VARCHAR,
            Email VARCHAR,
            NbElevator VARCHAR);"
            )
    end
# Sends data from various tables in mySQL to the postgreSQL server with the table name FactQuotes
    task :Send_Data_To_FactQuotes => :environment do                                                        
        quotes = Quote.all
        quotes.each do |quote|
            postgreSQL.exec("INSERT INTO FactQuotes 
                (
                QuoteId,
                Creation,
                Company_Name,
                Email,
                NbElevator
                )
                VALUES
                (
                #{quote.id},
                '#{quote.created_at}',
                '#{quote.Company_Name.gsub(/\W/, '')}',
                '#{quote.Email}',
                #{quote.Amount_Of_Elevators_Needed})"
                )
        end
    end
# Creates a new table and execute the code in the database you're connected to, add the new table inside that database named FactContact.
    task :Create_FactContact_Table do                                                                  
        postgreSQL.exec("CREATE TABLE FactContact
            (
            ContactId VARCHAR PRIMARY KEY NOT NULL,
            Creation_Date VARCHAR,
            Company_Name VARCHAR,
            Email VARCHAR,
            Project_Name VARCHAR
            );")
    end
# Sends data from various tables in mySQL to the postgreSQL server with the table name FactContact
    task :Send_Data_To_FactContact => :environment do                                                         
        leads = Lead.all
        leads.each do |lead|
            postgreSQL.exec("INSERT INTO FactContact 
            (
            ContactId,
            Creation_Date,
            Company_Name,
            Email,
            Project_Name
            )
            VALUES 
            (
            #{lead.id},
            '#{lead.created_at}',
            '#{lead.Company_Name.gsub(/\W/, '')}',
            '#{lead.Email}',
            '#{lead.Project_Name}'
            )")
        end
    end
# Creates a new table and execute the code in the database you're connected to, add the new table inside that database named FactElevator.
    task :Create_FactElevator_Table do                                                                        
        postgreSQL.exec("CREATE TABLE FactElevator
            ( 
            SerialNumber VARCHAR,
            Date_Of_Commissioning VARCHAR,
            BuildingId VARCHAR,
            CustomerId VARCHAR,
            Building_City VARCHAR
            );")
    end
# Sends data from various tables in mySQL to the postgreSQL server with the table name FactElevator
    task :Send_Data_To_FactElevator => :environment do
        Customer.all.each do |customer|
            customer.buildings.all.each do |building|
                building.batteries.all.each do |battery|
                    battery.columns.each do |column|
                        column.elevators.each do |elevator|
                            postgreSQL.exec("INSERT INTO FactElevator 
                                (
                                SerialNumber,
                                Date_Of_Commissioning,
                                BuildingId,
                                CustomerId,
                                Building_City
                                ) 
                                VALUES 
                                (
                                #{elevator.Serial_Number},
                                '#{elevator.created_at}', 
                                '#{building.id}', 
                                '#{customer.id}',
                                '#{elevator.column.battery.building.address.City.gsub(/\W/, '')}'
                                )")
                        end    
                    end
                end
            end
        end
    end
# Creates a new table and execute the code in the database you're connected to, add the new table inside that database named DimCustomers.
    task :Create_DimCustomers_Table do                                                                  
        postgreSQL.exec("CREATE TABLE DimCustomers(
            Creation_Date VARCHAR, 
            Company_Name VARCHAR, 
            Full_Name_Of_The_Company_Main_Contact VARCHAR,
            Email_Of_The_Company_Main_Contact VARCHAR,
            NbElevator VARCHAR,
            Customer_City VARCHAR
            );")
    end
# Sends data from the mySQL tables to the postgreSQL server with the table name DimCustomers
    task :Send_Data_To_DimCustomers => :environment do                                                         
        Customer.all.each do |customer|
            nbElevator = 0
            customer.buildings.all.each do |building|
                building.batteries.all.each do |battery|
                    battery.columns.each do |column|
                            nbElevator += column.elevators.count  
                            puts nbElevator                              
                        
                    end     
                end
            end
            postgreSQL.exec("INSERT INTO DimCustomers 
                (
                Creation_Date, 
                Company_Name, 
                Full_Name_Of_The_Company_Main_Contact, 
                Email_Of_The_Company_Main_Contact, 
                NbElevator, 
                Customer_City
                ) 
                VALUES 
                (
                '#{customer.created_at}',
                '#{customer.Company_Name.gsub(/\W/, '')}',
                '#{customer.Full_Name_Of_The_Company_Contact.gsub(/\W/, '')}',
                '#{customer.Email_Of_The_Company_Contact.gsub(/\W/, '')}',
                '#{nbElevator}',
                '#{customer.address.City.gsub(/\W/, '')}'
                )")
        end                       
    end  
    #push data in table FactIntervention
        task :Send_Data_To_FactIntervention => :environment do
            
            Building.all.each do |building|
                building.batteries.all.each do |battery|
                    battery.columns.each do |column|
                        column.elevators.each do |elevator|
                            dateFactInterStart = Faker::Date.between(from: '2019-01-01', to: '2022-07-15')
                            dateFactInterEnd = Faker::Time.between(from: dateFactInterStart + 1, to: dateFactInterStart + 48)
                            random = Faker::Number.between(from: 0, to: 3)

                            postgreSQL.exec("INSERT INTO FactIntervention 
                                (
                                EmployeeID,
                                BuildingID,
                                BatteryID,
                                ColumnID,
                                ElevatorID,
                                Start_Date_And_Time_Of_The_Intervention,
                                Date_And_Time_Of_The_End_Of_The_Intervention,
                                Result,
                                Report,
                                Status
                                ) 
                                VALUES 
                                (
                                #{battery.employee_id},
                                #{building.id}, 
                                #{random == 1 ? battery.id : random == 0 ? "NULL" : "NULL"},
                                #{random == 2 ? column.id : random == 0 ? "NULL" : "NULL"},
                                #{random == 3 ? elevator.id : random == 0 ? "NULL" : "NULL"},
                                '#{dateFactInterStart}',
                                '#{dateFactInterEnd}',
                                '#{["Success", "Failure", "Incomplete"].sample}',
                                '#{"lorem ipsum"}',
                                '#{["Pending", "InProgress ", "Interrupted", "Resumed", "Completed"].sample}'
                                )")
                        end    
                    end
                end
            end
        end

        #Creates FACTIntervention    
    task :Create_FactIntervention_Table do                                                                  
        postgreSQL.exec("CREATE TABLE FactIntervention
            (
            ID SERIAL PRIMARY KEY,
            EmployeeID VARCHAR NOT NULL,
            BuildingID VARCHAR NOT NULL,
            BatteryID VARCHAR,
            ColumnID VARCHAR,
            ElevatorID  VARCHAR,        
            Start_Date_And_Time_Of_The_Intervention TIMESTAMP NOT NULL,
            Date_And_Time_Of_The_End_Of_The_Intervention TIMESTAMP,
            Result VARCHAR NOT NULL,
            Report  VARCHAR,
            Status  VARCHAR NOT NULL
            );")
    end
    # task :audio1 => :environment do
    #     current_user do |employee|
    #         employee
    # end
end