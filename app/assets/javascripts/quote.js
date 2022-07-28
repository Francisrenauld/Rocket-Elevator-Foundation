/******************************************************************** Show / Hide menu items *********************************************************************/
console.log("quote.js launched");
$(function () {
	$("input[type='radio").change(function () {
		if ($(this).val() == "residentialBuilding") {
			console.log("residentialBuilding selected");
			residential();
		}
		if ($(this).val() == "corporateBuilding") {
			console.log("corporate selected");
			corpotate();
		}
		if ($(this).val() == "commercialBuilding") {
			console.log("commercial selected");
			commercial();
		}
		if ($(this).val() == "hybridBuilding") {
			console.log("Hybrid selected");
			hybrid();
		}
	});
});

/**************************************************************** END Show / Hide menu items **********************************************************************/

/******************************************************************************************************************************************************************/

/****************************************************************** The function for residentialBuildingType ******************************************************/

function residentialBuildingType() {
	console.log("residential calculator");
	var numbOfApartments = 0;
	var numbOfFloors = 0;
	var averageNumberOfApartmentsPerFloors = 0;
	var numbOfElevators = 0;
	var numberOfColumns = 0;

	$("#number-of-apartments, #number-of-floors").on("keyup keypress blur change", function (e) {
		numbOfApartments = parseInt($("#number-of-apartments").val());

		numbOfFloors = parseInt($("#number-of-floors").val());

		averageNumberOfApartmentsPerFloors = Math.ceil(numbOfApartments / numbOfFloors);

		numbOfElevators = Math.ceil(averageNumberOfApartmentsPerFloors / 6);

		numberOfColumns = Math.ceil(numbOfFloors / 20);

		numbOfElevators *= numberOfColumns;

		servicePrice(numbOfElevators);

		$("#elevator-amount").val(numbOfElevators);
	});
}

/******************************************************** END The function for residentialBuildingType ************************************************************/

/******************************************************************************************************************************************************************/

/********************************************************* The function for corporateAndHybridBuildingType ********************************************************/

function corporateAndHybridBuildingType() {
	console.log("corporate or hybrid calculator");
	var numOfFloors = 0; // Created a variable called numOfFloors and defined its initial value to 0. and you do the same thing for all of them.
	var numOfBasements = 0;
	var numFloorAndBasements = 0;
	var numOccupantsPerFloors = 0;
	var totalNumOccupants = 0;
	var numElevators = 0;
	var numColumnsRequired = 0;
	var averageNumberOfElevatorsPerColumns = 0;
	var finalElevatorAmount = 0;

	$("#number-of-basements, #number-of-floors, #maximum-occupancy ").on("keyup keypress blur change", function (e) {
		numOfFloors = $("#number-of-floors").val(); // Assign the variable "numOfFloors" to the Div with the ID="#number-of-floors" to put #number-of-floors' value inside of the numOfFloors variable.

		numOfBasements = $("#number-of-basements").val(); /* Same Thing for these 2 */

		numOccupantsPerFloors = $("#maximum-occupancy").val();

		numFloorAndBasements = +numOfFloors + +numOfBasements; // Add the number of Floors and Basements and create a new variable with both numbers combined in it.

		totalNumOccupants = numOccupantsPerFloors * numFloorAndBasements; //Multiply the number of Floors and Basements by the number of Occupants per Floors to give me a new variable with that number called total number of occupants.

		numElevators = totalNumOccupants / 1000; // Divide the number of total occupants by 1000 to give me the number of elevators.

		numColumnsRequired = Math.ceil(numFloorAndBasements / 20); // Divide the number of floors and basements by 20 to give me the number of columns required and round up that number.

		averageNumberOfElevatorsPerColumns = Math.ceil(numElevators / numColumnsRequired); // Divide the number of elevators by the number of columns and round up that number again to give you a new variable with the average of elevators per columns.

		finalElevatorAmount = Math.ceil(averageNumberOfElevatorsPerColumns * numColumnsRequired); // Multiply the average number of Elevators Per Columns by the number of columns and round up that number AGAIN to give you the final amount of elevator needed.

		servicePrice(finalElevatorAmount);

		$("#elevator-amount").val(finalElevatorAmount); // Send the value of the final elevator amount to the ReadOnly input that will tell you how many elevetors you'll need.
	});
}
/***************************************************** END The function for corporateAndHybridBuildingType ********************************************************/
/******************************************************************************************************************************************************************/
/********************************************************** The Function for commercialBuildingType ***************************************************************/

function commercialBuildingType() {
	console.log("commercial calculator");
	var numberOfCommercialElevators = 0;

	$("#number-of-elevators").on("keyup keypress blur change", function (e) {
		numberOfCommercialElevators = $("#number-of-elevators").val();
		servicePrice(numberOfCommercialElevators);
		$("#elevator-amount").val(numberOfCommercialElevators);
	});
}

/* ********************************************************* END  The Function for commercialBuildingType *************************************************************/
/**********************************************************************************************************************************************************************/
/* ********************************************************* The Function for services *******************************************************************************/

function servicePrice(numberOfElevators) {
	var elevatorPrice = 0;
	var installationFees = 0;
	var elevatorTotalPrice = 0;
	var finalPrice = 0;

	$("input[type='radio").on("click change", function (e) {
		if ($(this).val() == "standard") {
			console.log("standard service selected");
			installationFeesPrice = 0.1;
			elevatorPrice = 7565;
			elevatorTotalPrice = elevatorPrice * numberOfElevators;
			installationFees = installationFeesPrice * elevatorTotalPrice;
			finalPrice = +installationFees + +elevatorTotalPrice;

			$("#elevator-unit-price").val(
				new Intl.NumberFormat("en-CA", {
					style: "currency",
					currency: "CAD",
				}).format(elevatorPrice)
			);
			$("#elevator-total-price").val(
				new Intl.NumberFormat("en-CA", {
					style: "currency",
					currency: "CAD",
				}).format(elevatorTotalPrice)
			);

			$("#installation-fees").val(
				new Intl.NumberFormat("en-CA", {
					style: "currency",
					currency: "CAD",
				}).format(installationFees)
			);

			$("#final-price").val(
				new Intl.NumberFormat("en-CA", {
					style: "currency",
					currency: "CAD",
				}).format(finalPrice)
			);
		}

		$("input[type='radio").on("click change", function (e) {
			if ($(this).val() == "premium") {
				console.log("premium service selected");
				installationFeesPrice = 0.13;
				elevatorPrice = 12345;
				elevatorTotalPrice = elevatorPrice * numberOfElevators;
				installationFees = installationFeesPrice * elevatorTotalPrice;
				finalPrice = +installationFees + +elevatorTotalPrice;

				$("#elevator-unit-price").val(
					new Intl.NumberFormat("en-CA", {
						style: "currency",
						currency: "CAD",
					}).format(elevatorPrice)
				);
				$("#elevator-total-price").val(
					new Intl.NumberFormat("en-CA", {
						style: "currency",
						currency: "CAD",
					}).format(elevatorTotalPrice)
				);

				$("#installation-fees").val(
					new Intl.NumberFormat("en-CA", {
						style: "currency",
						currency: "CAD",
					}).format(installationFees)
				);

				$("#final-price").val(
					new Intl.NumberFormat("en-CA", {
						style: "currency",
						currency: "CAD",
					}).format(finalPrice)
				);
			}

			$("input[type='radio").on("click change", function (e) {
				if ($(this).val() == "excelium") {
					console.log("Excelium service selected");
					installationFeesPrice = 0.16;
					elevatorPrice = 15400;
					elevatorTotalPrice = elevatorPrice * numberOfElevators;
					installationFees = installationFeesPrice * elevatorTotalPrice;
					finalPrice = +installationFees + +elevatorTotalPrice;

					$("#elevator-unit-price").val(
						new Intl.NumberFormat("en-CA", {
							style: "currency",
							currency: "CAD",
						}).format(elevatorPrice)
					);
					$("#elevator-total-price").val(
						new Intl.NumberFormat("en-CA", {
							style: "currency",
							currency: "CAD",
						}).format(elevatorTotalPrice)
					);

					$("#installation-fees").val(
						new Intl.NumberFormat("en-CA", {
							style: "currency",
							currency: "CAD",
						}).format(installationFees)
					);

					$("#final-price").val(
						new Intl.NumberFormat("en-CA", {
							style: "currency",
							currency: "CAD",
						}).format(finalPrice)
					);
				}
			});
		});
	});
}

/*********************************************************** END The Function for services *******************************************************************************/
/*************************************************************************************************************************************************************************/
/******************************************************** Function to hide form when changing services *******************************************************************/

function hideFormNumbers() {
	$("#elevator-unit-price").val("");
	$("#elevator-total-price").val("");
	$("#installation-fees").val("");
	$("#final-price").val("");
	$("#elevator-amount").val("");
	$("#number-of-apartments").val("");
	$("#number-of-floors").val("");
	$("#number-of-basements").val("");
	$("#number-of-parking-spots").val("");
	$("#number-of-corporations").val("");
	$("#maximum-occupancy").val("");
	$("#number-of-companies").val("");
	$("#number-of-elevators").val("");
	$("#business-hours").val("");
}

function residential() {
	$(".corporate1").hide();
	$(".commercial1").hide();
	$(".hybrid1").hide();
	$(".residential1").show();
	$(".service").show();
	$("#number-of-apartments").show();
	$("#number-of-floors").show();
	$("#number-of-basements").show();
	$("#number-of-parking-spots").hide();
	$("#number-of-corporations").hide();
	$("#maximum-occupancy").hide();
	$("#number-of-companies").hide();
	$("#number-of-elevators").hide();
	$("#business-hours").hide();
	residentialBuildingType();
	hideFormNumbers();
	servicePrice();
}

function corpotate() {
	$(".commercial1").hide();
	$(".hybrid1").hide();
	$(".residential1").hide();
	$(".corporate1").show();
	$(".service").show();
	$("#number-of-floors").show();
	$("#number-of-basements").show();
	$("#maximum-occupancy").show();
	$("#number-of-parking-spots").show();
	$("#number-of-corporations").show();
	$("#number-of-companies").hide();
	$("#number-of-elevators").hide();
	$("#business-hours").hide();
	$("#number-of-apartments").hide();
	corporateAndHybridBuildingType();
	hideFormNumbers();
	servicePrice();
}

function commercial() {
	$(".corporate1").hide();
	$(".hybrid1").hide();
	$(".residential1").hide();
	$(".commercial1").show();
	$(".service").show();
	$("#number-of-elevators").show();
	$("#number-of-floors").show();
	$("#number-of-basements").show();
	$("#number-of-parking-spots").show();
	$("#number-of-companies").show();
	$("#number-of-corporations").hide();
	$("#maximum-occupancy").hide();
	$("#business-hours").hide();
	$("#number-of-apartments").hide();
	commercialBuildingType();
	hideFormNumbers();
	servicePrice();
}

function hybrid() {
	$(".corporate1").hide();
	$(".commercial1").hide();
	$(".residential1").hide();
	$(".hybrid1").show();
	$(".service").show();
	$("#number-of-floors").show();
	$("#number-of-basements").show();
	$("#maximum-occupancy").show();
	$("#business-hours").show();
	$("#number-of-parking-spots").show();
	$("#number-of-companies").show();
	$("#number-of-corporations").hide();
	$("#number-of-elevators").hide();
	$("#number-of-apartments").hide();
	corporateAndHybridBuildingType();
	hideFormNumbers();
	servicePrice();
}
