class GooglemapsController < ApplicationController
    def map
        @infoMap = []

        Building.all.each do |b|
            nbOfElevator = 0
            b.batteries.all.each do |battery|
                battery.columns.all.each do |column|
                    column.elevators.all.each
                    nbOfElevator += column.elevators.ids.count()
                    #column.Number_Of_Floors_Served.count()
                end
            end

            nbOfFloors = 0
            b.batteries.all.each do |battery|
                battery.columns.all.each do |column|
                    column.number_of_floors_served
                nbOfFloors += column.number_of_floors_served
                end
            end

            @infoMap.push(
                lat: b.address.lat,
                lng: b.address.lng,
                address: b.address.Number_And_Street,
                numberOfFloor: nbOfFloors,
                customerName: b.customer.Full_Name_Of_The_Company_Contact,
                numberOfBattery: b.battery_ids.count,
                numberOfColumns: b.batteries.columns.count,
                numberOfElevator: nbOfElevator,
                techContactName: b.Full_Name_Of_The_Technical_Contact_For_The_Building
            )
        end
    end
end