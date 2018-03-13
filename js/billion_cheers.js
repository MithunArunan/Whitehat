function doIt()
{
	if ($('.quest-text').text().indexOf('Abhinav') >= 0)
		{ $('#option2').trigger('click')  }
	else if ( $('.quest-text').text().indexOf('karnam') >= 0 )
		{ $('#option3').trigger('click') }
	else if ( $('.quest-text').text().indexOf('hymn') >= 0 )
		{ $('#option1').trigger('click') }
	else if ( $('.quest-text').text().indexOf('Sushil') >= 0 )
		{ $('#option2').trigger('click') }
	else if ( $('.quest-text').text().indexOf('artificial') >= 0 )
		{ $('#option2').trigger('click') }
	else if ( $('.quest-text').text().indexOf('400') >= 0 )
		{ $('#option3').trigger('click') }
	else if ( $('.quest-text').text().indexOf('diver') >= 0 )
		{ $('#option1').trigger('click') }
	else if ( $('.quest-text').text().indexOf('1896') >= 0 )
		{ $('#option2').trigger('click') }
	else if ( $('.quest-text').text().indexOf('gymnast') >= 0 )
		{ $('#option1').trigger('click') }
	else if ( $('.quest-text').text().indexOf('2000') >= 0 )
		{ $('#option3').trigger('click') }
	else if ( $('.quest-text').text().indexOf('Saina') >= 0 )
		{ $('#option1').trigger('click') }
};
doIt();
var jq = document.createElement('script');
jq.src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js";
document.getElementsByTagName('head')[0].appendChild(jq);
setInterval(doIt(),1000);
