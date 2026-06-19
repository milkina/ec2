function markAnswered(contextPath, id) {
    var changeElement = document.getElementById("isAnswered" + id);
    //if person isn't logged in return
    var isLoggedIn = document.getElementById("isLogin");
    if (!isLoggedIn) {
        changeElement.checked = false;
        alert("Please log in or register to have a possibility to mark questions.");
        return;
    }
   var liElementId = document.getElementById("li" + id);
    var url = contextPath + "/change-answered-question";
    var param = "";
    if (changeElement.checked) {
        param = param + "Checked=" + id;
        if(liElementId){
          liElementId.classList.remove('notAnsweredQuestion');
          liElementId.classList.add('answeredQuestion', 'is-done');
        }
    } else {
        param = param + "Unchecked=" + id;
         if(liElementId){
           liElementId.classList.remove('answeredQuestion', 'is-done');
           liElementId.classList.add('notAnsweredQuestion');
         }
    }
    req.open("POST", url, true);
    req.setRequestHeader("Content-Type",
            "application/x-www-form-urlencoded");
    req.send(param);
}

function changeShowingMode(element) {
    //if person isn't logged in return
    var isLoggedIn = document.getElementById("isLogin");
    if (!isLoggedIn) {
        alert("Please log in or register to have a possibility to mark questions.");
        return;
    }
    var checkedValue = element.value;
    var answeredQuestions = getElementsByClassName(document.body, "answeredQuestion");
    var notAnsweredQuestion = getElementsByClassName(document.body, "notAnsweredQuestion");
    if (checkedValue == "ALL") {
        changeLiArrayStyle(answeredQuestions, "block");
        changeLiArrayStyle(notAnsweredQuestion, "block");
    } else if (checkedValue == "ANSWERED") {
        changeLiArrayStyle(answeredQuestions, "block");
        changeLiArrayStyle(notAnsweredQuestion, "none");
    } else if (checkedValue == "NOT_ANSWERED") {
        changeLiArrayStyle(answeredQuestions, "none");
        changeLiArrayStyle(notAnsweredQuestion, "block");
    }
}
function changeLiArrayStyle(array, newStyle) {
    for (var i = 0; i < array.length; i++) {
        array[i].style.display = newStyle;
    }
}
function getElementsByClassName(node, classname) {
    var a = [];
    var re = new RegExp('(^| )' + classname + '( |$)');
    var els = node.getElementsByTagName("*");
    for (var i = 0,j = els.length; i < j; i++)
        if (re.test(els[i].className))a.push(els[i]);
    return a;
}
 function showAnswer(i,readMessage,hideMessage) {
           var element = document.getElementById("a" + i);
           var answerElement = document.getElementById("answer" + i);
            if (answerElement.style.display == "block"){
               answerElement.style.display = "none";
               element.innerHTML = readMessage;
            }else{
                answerElement.style.display = "block";
                element.innerHTML = hideMessage;
            }
       }

function deleteQuestion(contextPath, questionId,categoryPath,testPath) {
    if (confirm("Are you sure you want to delete the question?")) {
        window.location.href  = contextPath + '/delete-question?'+
        'QUESTION_ENTRY_ID_PARAM='+questionId+'&CATEGORY_PATH='+categoryPath+
        '&TEST_PATH='+testPath+'&EDIT_MODE_PARAM=DELETE';
    }
}

function approveQuestion(contextPath, questionId) {
    if (confirm("Are you sure you want to approve the question?")) {
        window.location.href  = contextPath + '/approve-question?'+
        'QUESTION_ENTRY_ID_PARAM=' + questionId;
    }
}
 function newXMLHttpRequest() {
     var xmlreq = false;
     if (window.XMLHttpRequest) {
         xmlreq = new XMLHttpRequest();
     } else if (window.ActiveXObject) {
         try {
             xmlreq = new ActiveXObject("Msxml2.XMLHTTP");
         } catch (e1) {
             try {
                 xmlreq = new ActiveXObject("Microsoft.XMLHTTP");
             } catch (e2) {
             }
         }
     }
     return xmlreq;
 }
 var req = newXMLHttpRequest();
 function sendAJAX(name, number, contextPath) {
     var idField = document.getElementById("userid");
     var url = contextPath + "/servlet/CreateExam";

     req.open("POST", url, true);
     req.onreadystatechange = reply;
     req.setRequestHeader("Content-Type",
             "application/x-www-form-urlencoded");

     req.send("examName=" + name + "&examCount=" + number);
 }

var currentPage = 1;
var itemsPerPage = 10;
var allItems = [];
var filteredItems = [];

function initPagination() {
    allItems = Array.from(document.querySelectorAll('.iq-item'));
    filteredItems = allItems.slice();
    updatePagination();
    
    var prevBtn = document.getElementById('iq-prev');
    var nextBtn = document.getElementById('iq-next');
    
    if (prevBtn) {
        prevBtn.addEventListener('click', function() {
            if (currentPage > 1) {
                currentPage--;
                updatePagination();
            }
        });
    }
    
    if (nextBtn) {
        nextBtn.addEventListener('click', function() {
            var totalPages = Math.ceil(filteredItems.length / itemsPerPage);
            if (currentPage < totalPages) {
                currentPage++;
                updatePagination();
            }
        });
    }
}

function updatePagination() {
    var totalPages = Math.ceil(filteredItems.length / itemsPerPage) || 1;
    if (currentPage > totalPages) currentPage = totalPages;
    
    var startIndex = (currentPage - 1) * itemsPerPage;
    var endIndex = startIndex + itemsPerPage;
    
    allItems.forEach(function(el) {
        el.style.display = 'none';
    });
    
    for (var i = startIndex; i < endIndex && i < filteredItems.length; i++) {
        filteredItems[i].style.display = '';
    }
    
    var pageInfo = document.getElementById('iq-page-info');
    if (pageInfo) {
        var pageText = pageInfo.getAttribute('data-page-text') || 'Page';
        var ofText = pageInfo.getAttribute('data-of-text') || 'of';
        pageInfo.textContent = pageText + ' ' + currentPage + ' ' + ofText + ' ' + totalPages;
    }
    
    var prevBtn = document.getElementById('iq-prev');
    var nextBtn = document.getElementById('iq-next');
    if (prevBtn) prevBtn.disabled = currentPage === 1;
    if (nextBtn) nextBtn.disabled = currentPage === totalPages;
}

function initSearch() {
    var searchEl = document.getElementById("iq-search");
    if (searchEl) {
        searchEl.addEventListener("input", function(e) {
            var q = e.target.value.trim().toLowerCase();
            filteredItems = allItems.filter(function(el) {
                var text = el.querySelector('.iq-q').textContent.toLowerCase();
                return text.includes(q);
            });
            currentPage = 1;
            updatePagination();
        });
    }
}

if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', function() {
        initPagination();
        initSearch();
    });
} else {
    initPagination();
    initSearch();
}




