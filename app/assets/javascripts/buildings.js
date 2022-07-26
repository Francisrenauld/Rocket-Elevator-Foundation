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
                        row = "<option value=\"" + j.id + "\">" + j.Full_Name_Of_The_Building_Administrator + "</option>";
                        $(row).appendTo("select#intervention_building_id");
                    });
                }
            });
        }
    });





});