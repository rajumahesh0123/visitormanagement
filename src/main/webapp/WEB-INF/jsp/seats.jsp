<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Seat Layout</title>
 

    <style>
    *, *:before, *:after {
  box-sizing: border-box;
}

html {
  font-size: 16px;
}

.plane {
  margin: 20px auto;
  max-width: 300px;
}

.exit {
  position: relative;
  height: 50px;
}
.exit:before, .exit:after {
  content: "EXIT";
  font-size: 14px;
  line-height: 18px;
  padding: 0px 2px;
  font-family: "Arial Narrow", Arial, sans-serif;
  display: block;
  position: absolute;
  background: green;
  color: white;
  top: 50%;
  transform: translate(0, -50%);
}
.exit:before {
  left: 0;
}
.exit:after {
  right: 0;
}

.fuselage {
  border-right: 5px solid #d8d8d8;
  border-left: 5px solid #d8d8d8;
}

ol {
  list-style: none;
  padding: 0;
  margin: 0;
}

.seats {
  display: flex;
  flex-direction: row;
  flex-wrap: nowrap;
  justify-content: flex-start;
}

.seat {
  display: flex;
  flex: 0 0 14.28571428571429%;
  padding: 5px;
  position: relative;
}
.seat:nth-child(3) {
  margin-right: 14.28571428571429%;
}
.seat input[type=checkbox] {
  position: absolute;
  opacity: 0;
}
.seat input[type=checkbox]:checked + label {
  background: #bada55;
  -webkit-animation-name: rubberBand;
  animation-name: rubberBand;
  animation-duration: 300ms;
  animation-fill-mode: both;
}
.seat input[type=checkbox]:disabled + label {
  background: #dddddd;
  text-indent: -9999px;
  overflow: hidden;
}
.seat input[type=checkbox]:disabled + label:after {
  content: "X";
  text-indent: 0;
  position: absolute;
  top: 4px;
  left: 50%;
  transform: translate(-50%, 0%);
}
.seat input[type=checkbox]:disabled + label:hover {
  box-shadow: none;
  cursor: not-allowed;
}
.seat label {
  display: block;
  position: relative;
  width: 100%;
  text-align: center;
  font-size: 14px;
  font-weight: bold;
  line-height: 1.5rem;
  padding: 4px 0;
  background: #F42536;
  border-radius: 5px;
  animation-duration: 300ms;
  animation-fill-mode: both;
}
.seat label:before {
  content: "";
  position: absolute;
  width: 75%;
  height: 75%;
  top: 1px;
  left: 50%;
  transform: translate(-50%, 0%);
  background: rgba(255, 255, 255, 0.4);
  border-radius: 3px;
}
.seat label:hover {
  cursor: pointer;
  box-shadow: 0 0 0px 2px #5C6AFF;
}

@-webkit-keyframes rubberBand {
  0% {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1);
  }
  30% {
    -webkit-transform: scale3d(1.25, 0.75, 1);
    transform: scale3d(1.25, 0.75, 1);
  }
  40% {
    -webkit-transform: scale3d(0.75, 1.25, 1);
    transform: scale3d(0.75, 1.25, 1);
  }
  50% {
    -webkit-transform: scale3d(1.15, 0.85, 1);
    transform: scale3d(1.15, 0.85, 1);
  }
  65% {
    -webkit-transform: scale3d(0.95, 1.05, 1);
    transform: scale3d(0.95, 1.05, 1);
  }
  75% {
    -webkit-transform: scale3d(1.05, 0.95, 1);
    transform: scale3d(1.05, 0.95, 1);
  }
  100% {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1);
  }
}
@keyframes rubberBand {
  0% {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1);
  }
  30% {
    -webkit-transform: scale3d(1.25, 0.75, 1);
    transform: scale3d(1.25, 0.75, 1);
  }
  40% {
    -webkit-transform: scale3d(0.75, 1.25, 1);
    transform: scale3d(0.75, 1.25, 1);
  }
  50% {
    -webkit-transform: scale3d(1.15, 0.85, 1);
    transform: scale3d(1.15, 0.85, 1);
  }
  65% {
    -webkit-transform: scale3d(0.95, 1.05, 1);
    transform: scale3d(0.95, 1.05, 1);
  }
  75% {
    -webkit-transform: scale3d(1.05, 0.95, 1);
    transform: scale3d(1.05, 0.95, 1);
  }
  100% {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1);
  }
}
.rubberBand {
  -webkit-animation-name: rubberBand;
  animation-name: rubberBand;
}

    </style>
    
    <script>
    function changeSeatStatus(seats, noOfTickets){
    	
    	alert(noOfTickets + " seats to be selected" );
    	
    	for(var i = 0; i < seats.length; i++)
    	{
    		
    		document.getElementById(seats[i]).setAttribute("disabled", true);
    	}
    	
    	
    }
   
    function countCheckboxes(noOfTickets, id){
    	var obj;
    	if (noOfTickets!=document.querySelectorAll('input[type="checkbox"]:checked').length){
    		alert("You Should Select Exactly " + noOfTickets + " For Booking");
    		return false;
    	}
    	nodeList=document.querySelectorAll('input[type="checkbox"]:checked');
    	let myArray = Array.from(nodeList)
    	var elements;
    	for (var index = 0; index < nodeList.length; index++) {
    	    
    	    if (elements != null )
    	    elements = elements + "," + nodeList[index].id;
    	    else 
    	    	elements=nodeList[index].id;
    	}
    	document.getElementById("seatsSelected").value = elements;
    	document.getElementById("id").value=id;
    	return true;
    }
    </script>
</head>
<body onload="changeSeatStatus(${bookedSeats}, ${noOfTickets})">


<form action="seats" method="post" onsubmit="return countCheckboxes(${noOfTickets}, ${id})">
<input type="hidden" name="seatsSelected" id="seatsSelected" value="">
<input type="hidden" name="id" id="id" value="">
    <div class="plane">
        <h1>Select Seats</h1>
      <div class="fuselage">
        
      </div>
      <ol class="cabin fuselage">
        <li class="row row--1">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="1" name="1" />
              <label for="1">1</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="2" name="2" />
              <label for="2">2</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="3" name="3" />
              <label for="3">3</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="4" name="4" />
              <label for="4">4</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="5" name="5" />
              <label for="5">5</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="6" name="6" />
              <label for="6">6</label>
            </li>
           </ol>
        </li>
        <li class="row row--2">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="7" name="7" />
              <label for="7">7</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="8" name="8" />
              <label for="8">8</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="9" name="9" />
              <label for="9">9</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="10" name="10" />
              <label for="10">10</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="11" name="11" />
              <label for="11">11</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="12" name="12" />
              <label for="12">12</label>
            </li>
           </ol>
        </li>
        <li class="row row--3">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="13" name="13" />
              <label for="13">13</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="14" name="14" />
              <label for="14">14</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="15" name="15" />
              <label for="15">15</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="16" name="16" />
              <label for="16">16</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="17" name="17" />
              <label for="17">17</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="18" name="18" />
              <label for="18">18</label>
            </li>
           </ol>
        </li>
        <li class="row row--4">
          <ol class="seats" type="A">
            <li class="seat">
              <input type="checkbox" id="19" name="19" />
              <label for="19">19</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="20" name="20" />
              <label for="20">20</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="21" name="21" />
              <label for="21">21</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="22" name="22" />
              <label for="22">22</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="23" name="23" />
              <label for="23">23</label>
            </li>
            <li class="seat">
              <input type="checkbox" id="24" name="24" />
              <label for="24">24</label>
            </li>
           </ol>
        </li>
        
      </ol>
      <div class="fuselage">
        
      </div>
       <div class="form-field col-lg-12">
            <input class="submit-btn" type="submit" value="Submit" >
        </div>
      
    </div>
    </form>
  </body>

  </html>