# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_07_25_180146) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "Type_Of_Address"
    t.string "Status"
    t.string "Entity"
    t.string "Number_And_Street"
    t.string "Suite_Or_Apartment"
    t.string "City"
    t.string "Postal_Code"
    t.string "Country"
    t.string "Notes"
    t.float "Lat"
    t.float "Lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "batteries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "Type"
    t.string "Status"
    t.date "Date_Of_Commissioning"
    t.date "Date_Of_Last_Inspection"
    t.string "Certificate_Of_Operations"
    t.string "Information"
    t.string "Notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "building_id"
    t.bigint "employee_id"
    t.index ["building_id"], name: "index_batteries_on_building_id"
    t.index ["employee_id"], name: "index_batteries_on_employee_id"
  end

  create_table "building_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "Information_Key"
    t.string "Value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "building_id"
    t.index ["building_id"], name: "index_building_details_on_building_id"
  end

  create_table "buildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "Full_Name_Of_The_Building_Administrator"
    t.string "Email_Of_The_Administrator_Of_The_Building"
    t.string "Phone_Number_Of_The_Building_Administrator"
    t.string "Full_Name_Of_The_Technical_Contact_For_The_Building"
    t.string "Technical_Contact_Email_For_The_Building"
    t.string "Technical_Contact_Phone_For_The_Building"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.bigint "address_id"
    t.index ["address_id"], name: "index_buildings_on_address_id"
    t.index ["customer_id"], name: "index_buildings_on_customer_id"
  end

  create_table "columns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "Type"
    t.integer "Number_Of_Floors_Served"
    t.string "Status"
    t.string "Information"
    t.string "Notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "battery_id"
    t.index ["battery_id"], name: "index_columns_on_battery_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "Company_Name"
    t.string "Company_Headquarters_Adress"
    t.string "Full_Name_Of_The_Company_Contact"
    t.string "Company_Contact_Phone"
    t.string "Email_Of_The_Company_Contact"
    t.text "Company_Description"
    t.string "Full_Name_Of_Service_Technical_Authority"
    t.string "Technical_Authority_Phone_For_Service"
    t.string "Technical_Manager_Email_For_Service"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "address_id"
    t.index ["address_id"], name: "index_customers_on_address_id"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "elevators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "Serial_Number"
    t.string "Model"
    t.string "Type"
    t.string "Status"
    t.date "Date_Of_Commissioning"
    t.date "Date_Of_Last_Inspection"
    t.string "Certificate_Of_Inspection"
    t.string "Information"
    t.string "Notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "column_id"
    t.index ["column_id"], name: "index_elevators_on_column_id"
  end

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "First_Name"
    t.string "Last_Name"
    t.string "Title_Or_Function"
    t.string "Email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "interventions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "author", null: false
    t.integer "customer_id", null: false
    t.integer "building_id", null: false
    t.integer "battery_id", null: false
    t.integer "column_id"
    t.integer "elevator_id"
    t.integer "employee_id"
    t.datetime "start_date_and_time_of_the_intervention"
    t.datetime "end_date_and_time_of_the_intervention"
    t.string "result", default: "incomplete"
    t.string "report"
    t.string "status", default: "Pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "Full_Name_Of_The_Contact"
    t.string "Company_Name"
    t.string "Email"
    t.string "Phone"
    t.string "Project_Name"
    t.string "Project_Description"
    t.string "Departement_In_Charge_Of_The_Elevators"
    t.text "Message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "Building_Type"
    t.integer "Number_of_apartments"
    t.integer "Number_of_floors"
    t.integer "Number_of_basements"
    t.string "Number_of_separate_companies"
    t.integer "Number_of_parking_spaces"
    t.integer "Maximum_Number_Of_Occupants_Per_Floor"
    t.integer "Number_Of_Dstinct_Businesses"
    t.integer "Number_Of_Elevators_Needed"
    t.integer "Number_Of_Hours_Of_Activity_Of_The_Building"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "Type_Of_Installation"
    t.integer "Amount_Of_Elevators_Needed"
    t.text "Elevator_Unit_Price"
    t.text "Elevator_Total_Price"
    t.text "Installation_Fees"
    t.text "Final_Price"
    t.string "Email"
    t.string "Company_Name"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "admin"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "batteries", "buildings"
  add_foreign_key "batteries", "employees"
  add_foreign_key "building_details", "buildings"
  add_foreign_key "buildings", "addresses"
  add_foreign_key "buildings", "customers"
  add_foreign_key "columns", "batteries"
  add_foreign_key "customers", "addresses"
  add_foreign_key "customers", "users"
  add_foreign_key "elevators", "columns"
  add_foreign_key "employees", "users"
end
