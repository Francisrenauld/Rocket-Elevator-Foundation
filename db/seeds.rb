require 'faker'
require 'json'

data = JSON.parse(File.read(Rails.root.join('lib','addresses.json')))

date1 = Faker::Date.between(from: '2019-01-01', to: '2022-05-18')

user = User.create!(
    admin: true,
    email: "mathieu.houde@codeboxx.biz",
    password: "Password123",
    created_at: date1,
    updated_at: date1,
)

user = User.create!(
    admin: true,
    email: "eileen.ai@codeboxx.biz",
    password: "Password123",
    created_at: date1,
    updated_at: date1,
)

user = User.create!(
    admin: true,
    email: "patrick.thibault@codeboxx.biz",
    password: "Password123",
    created_at: date1,
    updated_at: date1,
)



user = User.create!(
    admin: true,
    email: "francis.patry-jessop@codeboxx.biz",
    password: "Password123",
    created_at: date1,
    updated_at: date1,
)

user = User.create!(
    admin: true,
    email: "david.amyot@codeboxx.biz",
    password: "Password123",
    created_at: date1,
    updated_at: date1,
)

user = User.create!(
    admin: true,
    email: "marie-eve.goupil@codeboxx.biz",
    password: "Password123",
    created_at: date1,
    updated_at: date1,
)

user = User.create!(
    admin: true,
    email: "francois.boivin@codeboxx.biz",
    password: "Password123",
    created_at: date1,
    updated_at: date1,
)

user = User.create!(
    admin: true,
    email: "timothy.wever@codeboxx.biz",
    password: "Password123",
    created_at: date1,
    updated_at: date1,
)

user = User.create!(
    admin: true,
    email: "kiril.kleinerman@codeboxx.biz",
    password: "Password123",
    created_at: date1,
    updated_at: date1,
)

user = User.create!(
    admin: true,
    email: "felicia.hartono@codeboxx.biz",
    password: "Password123",
    created_at: date1,
    updated_at: date1,
)

allEmployee = Array[

employee = Employee.create!(
    users_id: user["id"],
    First_Name: "Patrick",
    Last_Name: "Thibault", 
    Title_Or_Function: "Maximalist",
    Email: "patrick.thibault@codeboxx.biz",

),

employee = Employee.create!(
    users_id: user["id"],
    First_Name: "Mathieu",
    Last_Name: "Houde",
    Title_Or_Function: 'Gopher',
    Email: "mathieu.houde@codeboxx.biz",

),

employee = Employee.create!(
    users_id: user["id"],
    First_Name: "Francis",
    Last_Name: "Patry-Jessop",
    Title_Or_Function: "Captain",
    Email: "francis.patry-jessop@codeboxx.biz",

),

employee = Employee.create!(
    users_id: user["id"],
    First_Name: "David",
    Last_Name: "Amyot",
    Title_Or_Function: "The Man	",
    Email: "david.amyot@codeboxx.biz",

),

employee = Employee.create!(
    users_id: user["id"],
    First_Name: "Marie-Ève",
    Last_Name: "Goupil",
    Title_Or_Function: "AI Master",
    Email: "marie-eve.goupil@codeboxx.biz",

),

employee = Employee.create!(
    users_id: user["id"],
    First_Name: "François",
    Last_Name: "Boivin",
    Title_Or_Function: "The Tank",
    Email: "francois.boivin@codeboxx.biz",

),

employee = Employee.create!(
    users_id: user["id"],
    First_Name: "Timothy",
    Last_Name: "Wever",
    Title_Or_Function: "Beard whisperer",
    Email: "timothy.wever@codeboxx.biz",

),

employee = Employee.create!(
    users_id: user["id"],
    First_Name: "Kiril",
    Last_Name: "Kleinerman",
    Title_Or_Function: "I <3 Winnipeg",
    Email: "kiril.kleinerman@codeboxx.biz",

),


employee = Employee.create!(
    users_id: user["id"],
    First_Name: "Felicia",
    Last_Name: "Hartono",
    Title_Or_Function: "Scrums are too early",
    Email: "felicia.hartono@codeboxx.biz",

),



employee = Employee.create!(
    users_id: user["id"],
    First_Name: "Eileen",
    Last_Name: "Ai",
    Title_Or_Function: "They really are.",
    Email: "eileen.ai@codeboxx.biz",

)]

data["addresses"].each do |address|

    date = Faker::Date.between(from: '2019-01-01', to: '2022-05-18')
    cbe = Faker::Date.between(from: '2019-01-01', to: '2022-05-18')

        user = User.create!(
        admin: false,
        email: Faker::Internet.email,
        password: "Password123",
        created_at: date,
        updated_at: date,
    )

        customer = Customer.create!(
        users_id: user["id"],
        Company_Name: Faker::Company.name,
        Company_Headquarters_Adress: address["address1"],
        Full_Name_Of_The_Company_Contact: Faker::Company.name,
        Company_Contact_Phone: Faker::PhoneNumber.phone_number,
        Email_Of_The_Company_Contact: Faker::Internet.email,         
        Company_Description: "lorem ipsum",
        Full_Name_Of_Service_Technical_Authority:Faker::Company.name,
        Technical_Authority_Phone_For_Service: Faker::PhoneNumber.phone_number,
        Technical_Manager_Email_For_Service: Faker::Internet.email,
        created_at: date,
        updated_at: date,
    )

    address_obj = Address.create!(
        customer: customer,
        Type_Of_Address:["business", "billing", "shipping", "home"].sample,
        Status: ["active", "inactive"].sample,
        Entity: ["customer", "building"].sample,
        Number_And_Street: address["address1"],
        Suite_Or_Apartment: ("lorem ipsum"),
        City: address["city"].gsub(/\W/, ''),
        Postal_Code: address["postalCode"],
        Country: ("US"),
        Notes: ("lorem ipsum"),
        created_at: date,
        updated_at: date,
    )





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
        buildings_id: building["id"],
        Information_Key: "nbOfFloors",
        Value: Faker::Number.between(from: 1, to: 150),
        created_at: date,
        updated_at: date,
    )

        nbTime1 = Faker::Number.between(from: 1, to: 2)

        nbTime1.times do 

        battery = Battery.create!(
            employees_id: allEmployee["id"].sample,
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

            nbTime2 = Faker::Number.between(from: 1, to: 2)

            nbTime2.times do 

            column = Column.create!(
                batteries_id: battery["id"],
                Type:["Résidentiel", "Commercial", "Corporatif"].sample,
                Number_Of_Floors_Served: Faker::Number.between(from: 1, to: 150),
                Status: ["Active" , "Inactive", "Intervention"].sample,
                Information: "lorem ipsum",
                Notes: "lorem ipsum",
                created_at: cbe,
                updated_at: cbe,
            )

                nbTime3 = Faker::Number.between(from: 1, to: 2)

                nbTime3.times do 

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
    
    lead = Lead.create!(
        Full_Name_Of_The_Contact: Faker::Name.name,
        Company_Name: Faker::Company.name,
        Email: Faker::Internet.email,
        Phone: Faker::PhoneNumber.phone_number,
        Project_Name: "lorem ipsum",
        Project_Description: "lorem ipsum",
        Departement_In_Charge_Of_The_Elevators:["Residential", "Corporate", "Commercial", "Hybrid"].sample,
        Message: "lorem ipsum",
        Attached_File_Stored_As_A_Binary_File: nil,
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