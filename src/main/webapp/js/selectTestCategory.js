   $(document).on("change", "#TEST_PATH", function() {
       $.get("${pageContext.request.contextPath}/change-course",{TEST_PATH: $("select#TEST_PATH").val()}, function(responseJson) {
           var $select = $("#CATEGORY_PATH");
           $select.find("option").remove();
           $.each(responseJson, function(key, value) {
               $("<option>").val(key).text(value).appendTo($select);
           });
       });
   });