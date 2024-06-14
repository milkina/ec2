$(document).ready(function() {
                 $("#table-1").tableDnD({
                    onDrop: function(table, row) {
                        var previousTestElement = row.previousElementSibling;
                        moveTestUp(row.id, previousTestElement.id,
                        '${pageContext.request.contextPath}');
                    }
                 });
              });
 $(document).ready(function() {
                         $("#table-1").tableDnD({
                            onDrop: function(table, row) {
                                var previousCategoryElement = row.previousElementSibling;
                                moveCategoryUp(row.id, previousCategoryElement.id, '${pageContext.request.contextPath}','${param.TEST_PATH}');
                            }
                         });
                      });