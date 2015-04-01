//Main javascript for Venus
//Dependent on jQuery core and UI library
//This file should be loaded after the jQuery core and UI library has loaded

//Prevent jQuery's object variable "$" from conflicting with other libraries that also use "$"
//Use another variable "$j" instead of "$"
//Or could also use "jQuery"
//var $j = jQuery.noConflict();
var $j = jQuery;

//The DOM ID of Visualforce elements contains the â€˜:â€™ character, but in jQuery, 
//the â€˜:â€™ is a special character and needs to be escaped.
//This function escapes CSS notation characters (colon ":" and dot ".")
//Add "\\" in front of those characters
//And add # in front of the ID
function escapeID(id)
{ 
    return '#' + id.replace(/(:|\.)/g,'\\$1');
}

function jQEscape(value)
{
	return value.replace(/(:|\.)/g,'\\$1');
}

function escapeInputName(name)
{ 
    return 'input[name=' + name.replace(/(:|\.)/g,'\\$1') + ']';
}

//The functions for Component: MultiSelectCheckbox-----
//Initializes the checkbox values from the given input field id
//Called on page load
function initCMSC(id)
{
   	var inputId = $j(escapeID(id));
   	var inputValue = inputId.val();
   	if (inputValue != null)
   	{   		
   		var values = inputValue.split(';');
   		/* prototypejs breaks javascript foreach loops	
   		for (v in values)
   		{
   			$j(escapeID('cmsc_' + values[v] + '_' + id)).prop("checked", true);
   		}
   		*/
   		for (var i=0; i<values.length; i++)
   			$j(escapeID('cmsc_' + values[i] + '_' + id)).prop("checked", true);
   	}
}
//Updates the input field value based on the changes on the checkbox values
//Called onchange of checkbox value
function updateCMSC(id)
{
	var inputId = $j(escapeID(id));
	var values = new Array();
	$j(escapeInputName('cmsc_' + id) + ':checked').each(function() {	    		
		values.push(this.value);
	});
	inputId.val(values.join(';'));	    	
}
//---------


//Generates random color in Hex format
function randomHexColor() {
    var hexNumbers = '0123456789ABCDEF'.split('');
    var color = '#';
    for (var i = 0; i < 6; i++)
    {        
        var randomHexNumber = Math.round(Math.random() * 15);
        color += hexNumbers[randomHexNumber];
    }
    return color;
}

//Generates random light color in Hex format
function randomHexColorLight() {
    var hexNumbers = 'ABCDEF'.split('');
    var color = '#';
    for (var i = 0; i < 6; i++)
    {        
        var randomHexNumber = Math.round(Math.random() * 5);
        color += hexNumbers[randomHexNumber];
    }
    return color;
}
//Auto scrolls the scroll bar to the position of the given id
function scrollToId(id)
{
    $j("#"+id).get(0).scrollIntoView(false); //scrollIntoView() is native to the browser
}

//A simple function to show the first element and hide the second element
function toggleBox(boxToShow, boxToHide)
{
    $j(boxToHide).hide();
    $j(boxToShow).show();    
}

//Format to a dollar currency given a number
//Sample Input: 25605400 Output: $25,605,400
function currencyFormatter(num, numOfDigits)
{/*
  if (num != '')
  {
    num = num.replace('$',''); //remove all dollar
    return '$' + numberFormatter(num, numOfDigits, 2); 
  }
  else*/
    return num;
}

//Sample Input: 25605400.50 Output: 25,605,400.50
function numberFormatter(num, numOfDigits, decimalPlaces)
{          
    num = num.replace(/\,/g,''); //remove all commas           
    if(isNaN(num)) //if not a number than return without formatting                   
        return num;               
    else
    {
        var numBeforeDot;
        var numAfterDot;
        if (num.search('\\.')>=0)
        {
            numBeforeDot = num.split('.')[0];
            numAfterDot = num.split('.')[1];            
        }
        else
            numBeforeDot = num;
        var numLength = numBeforeDot.length;  
        if ( numLength>numOfDigits )
          numBeforeDot = numBeforeDot.slice(0, numOfDigits);               
        var formattedNum = commaFormatter(numBeforeDot);
        if (num.search('\\.')>=0)
        {
            if(decimalPlaces > 0)
            {
              numAfterDot = numAfterDot.slice(0, decimalPlaces);
              formattedNum += ('.' + numAfterDot);
            }
        }                                   
        return formattedNum;
    }
} 

//Given a number it formats by inserting commas at every thousandth
function commaFormatter(num)
{
	return num;
/*
  var numLength = num.length;
  var commas = Math.floor((numLength-1)/3);  //Number of commas         
  var formattedNum = '';  
  for (var i=0; i<numLength; i++)
  {
      if ( i==numLength-(commas*3) )
      {                           
          formattedNum += ',';                                    
          commas--;
      }
      formattedNum += num.charAt(i);        
  }
  return formattedNum;
*/
}

//Function to disable an input form element
//To enable an element set the second parameter to true
function disableInputElement(elementID, isEnabled)
{
  var id = escapeID(elementID);
  if (isEnabled == undefined || isEnabled == false)
    $j(id).attr('disabled', true);
  else
    $j(id).attr('disabled', false);
  $j(id).val(''); //Clear the value.  
}

//blockUI is a function which uses the jQuery BlockUI plugin
//to block/lock the UI interaction on the given element
//by placing an overlay over the element
//Useful during ajax requests
function blockUI(element)
{
    $j(element).block({
      css: { 
        border: 'none', 
        padding: '15px', 
        backgroundColor: '#000', 
        '-webkit-border-radius': '10px', 
        '-moz-border-radius': '10px', 
        opacity: .5,
        color: '#fff'            
      }
    });
}
//Used to unblock the UI on the given element
//Always used after having blocking it with the above blockUI function
function unblockUI(element)
{
    $j(element).unblock();
}

function confirmDelete()
{
  if (confirm('Are you sure?'))
      return true;
  else
      return false;
}

//Dynamically change SF apex:tab label 
function SFTabLabel(tabId, label)
{
	var tabLabelContainer = $j(escapeID(tabId) + '_lbl');	
	if (tabLabelContainer.length > 0)	
		tabLabelContainer.html(label);
}

//Dynamically append count to a SF apex:tab label
function SFTabLabelCount(tabId, count)
{
	var tabLabelContainer = $j(escapeID(tabId) + '_lbl');
	var tabLabel = tabLabelContainer.html();
	var pattern = /\(\d+\)/;
	if (tabLabel != null)
	{
		tabLabel = tabLabel.replace(pattern, '');
		$j.trim(tabLabel);
		tabLabelContainer.html(tabLabel + ' (' + count + ')');
	}	
}

//Select/Deselects checkbox group
function checkboxSelected(checkbox)
{
	var status = $j(checkbox).prop('checked'); //Returns true if checkbox is selected, else false
	var checkboxName = jQEscape(checkbox.name);
	if (checkbox.value == 'SelectAll')
		$j('input:checkbox[name=' + checkboxName + ']').attr('checked', status);
	else if (status == false)
		$j('input:checkbox[name=' + checkboxName + '][value="SelectAll"]').attr('checked', false);
}

/* //Function to clear text selection
function clearSelection()
    {
        if (window.getSelection)
        {
            if (window.getSelection().empty) {  // Chrome
                window.getSelection().empty();
            }
            else if (window.getSelection().removeAllRanges) {  // Firefox
                window.getSelection().removeAllRanges();
            }
        }
        else if (document.selection) {  // IE?
            document.selection.empty();
        }
    }
*/

//Reads the browser cookie by name
function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
} 

//Create cookie
function createCookie(name,value,days) {
	if (days) {
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = "; expires="+date.toGMTString();
	}
	else var expires = "";
	document.cookie = name+"="+value+expires+"; path=/";
}

//Delete cookie
function eraseCookie(name) {
	createCookie(name,"",-1);
}

//Reads the session key from the browser cookie
function brilyintSessionKey()
{
	return readCookie('apex__venusSession');
}