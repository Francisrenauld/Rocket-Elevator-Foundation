$(document).ready(function () {
    $("#building").hide();
    $("#battery").hide();
    $("#column").hide();
    $("#elevator").hide();

});
$(document).on('change', "#intervention_customer_id", function () {

    $("#building").show();
    $("#battery").hide();
    $("#column").hide();
    $("#elevator").hide();

});
$(document).on('change', "#intervention_building_id", function () {

    $("#battery").show();
    $("#column").hide();
    $("#elevator").hide();

});
$(document).on('change', "#intervention_battery_id", function () {

    $("#column").show();

    $("#elevator").hide();

});
$(document).on('change', "#intervention_column_id", function () {

    $("#elevator").show();
});

$(function () {

    if ($("select#intervention_customer_id").val() == "") {
        $("select#intervention_building_id option").remove();
        var row = "<option value=\"" + "" + "\">" + "--Select--" + "</option>";
        console.log(row);
        $(row).appendTo("select#intervention_building_id");
    }
    $("select#intervention_customer_id").change(function () {
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            $("select#intervention_building_id option").remove();
            var row = "<option value=\"" + "" + "\">" + "--Select--" + "</option>";
            console.log(row);
            $(row).appendTo("select#intervention_building_id");
        } else {
            // Send the request and update course dropdown
            $.ajax({
                dataType: "json",
                cache: false,
                url: '/get_buildings_by_customer/' + id_value_string,
                timeout: 5000,
                error: function (XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
                },
                success: function (data) {
                    // Clear all options from course select
                    $("select#intervention_building_id option").remove();
                    //put in a empty default line
                    var row = "<option value=\"" + "" + "\">" + "--Select--" + "</option>";
                    console.log(row);
                    $(row).appendTo("select#intervention_building_id");
                    // Fill course select
                    $.each(data, function (i, j) {
                        row = "<option value=\"" + j.id + "\">" + j.id + "/" + j.Full_Name_Of_The_Building_Administrator + "</option>";
                        $(row).appendTo("select#intervention_building_id");
                    });
                }
            });
        }
    });
    if ($("select#intervention_building_id").val() == "") {
        $("select#intervention_battery_id option").remove();
        var row = "<option value=\"" + "" + "\">" + "--Select--" + "</option>";
        console.log(row);
        $(row).appendTo("select#intervention_battery_id");
    }
    $("select#intervention_building_id").change(function () {
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            $("select#intervention_battery_id option").remove();
            var row = "<option value=\"" + "" + "\">" + "--Select--" + "</option>";
            console.log(row);
            $(row).appendTo("select#intervention_battery_id");
        } else {
            // Send the request and update course dropdown
            $.ajax({
                dataType: "json",
                cache: false,
                url: '/get_batteries_by_buildings/' + id_value_string,
                timeout: 5000,
                error: function (XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
                },
                success: function (data) {
                    // Clear all options from course select
                    $("select#intervention_battery_id option").remove();
                    //put in a empty default line
                    var row = "<option value=\"" + "" + "\">" + "--Select--" + "</option>";
                    console.log(row);
                    $(row).appendTo("select#intervention_battery_id");
                    // Fill course select
                    $.each(data, function (i, j) {
                        row = "<option value=\"" + j.id + "\">" + j.id + "/" + j.Type + "</option>";
                        $(row).appendTo("select#intervention_battery_id");
                    });
                }
            });
        }
    });

    if ($("select#intervention_battery_id").val() == "") {
        $("select#intervention_column_id option").remove();
        var row = "<option value=\"" + "" + "\">" + "--Select--" + "</option>";
        console.log(row);
        $(row).appendTo("select#intervention_column_id");
    }
    $("select#intervention_battery_id").change(function () {
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            $("select#intervention_column_id option").remove();
            var row = "<option value=\"" + "" + "\">" + "--Select--" + "</option>";
            console.log(row);
            $(row).appendTo("select#intervention_column_id");
        } else {
            // Send the request and update course dropdown
            $.ajax({
                dataType: "json",
                cache: false,
                url: '/get_columns_by_batteries/' + id_value_string,
                timeout: 5000,
                error: function (XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
                },
                success: function (data) {
                    // Clear all options from course select
                    $("select#intervention_column_id option").remove();
                    //put in a empty default line
                    var row = "<option value=\"" + "" + "\">" + "--Select--" + "</option>";
                    console.log(row);
                    $(row).appendTo("select#intervention_column_id");
                    // Fill course select
                    $.each(data, function (i, j) {
                        row = "<option value=\"" + j.id + "\">" + j.id + "/" + j.Type + "</option>";
                        $(row).appendTo("select#intervention_column_id");
                    });
                }
            });
        }
    });
    if ($("select#intervention_column_id").val() == "") {
        $("select#intervention_elevator_id option").remove();
        var row = "<option value=\"" + "" + "\">" + "--Select--" + "</option>";
        console.log(row);
        $(row).appendTo("select#intervention_elevator_id");
    }
    $("select#intervention_column_id").change(function () {
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            $("select#intervention_elevator_id option").remove();
            var row = "<option value=\"" + "" + "\">" + "--Select--" + "</option>";
            console.log(row);
            $(row).appendTo("select#intervention_elevator_id");
        } else {
            // Send the request and update course dropdown
            $.ajax({
                dataType: "json",
                cache: false,
                url: '/get_elevators_by_columns/' + id_value_string,
                timeout: 5000,
                error: function (XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
                },
                success: function (data) {
                    // Clear all options from course select
                    $("select#intervention_elevator_id option").remove();
                    //put in a empty default line
                    var row = "<option value=\"" + "" + "\">" + "--Select--" + "</option>";
                    console.log(row);
                    $(row).appendTo("select#intervention_elevator_id");
                    // Fill course select
                    $.each(data, function (i, j) {
                        row = "<option value=\"" + j.id + "\">" + j.id + "/" + j.Serial_Number + "</option>";
                        $(row).appendTo("select#intervention_elevator_id");
                    });
                }
            });
        }
    });
});