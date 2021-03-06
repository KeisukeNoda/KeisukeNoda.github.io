/*
Not necessary but don't know how to do:
-Restrict scope of variables to just this file?
-Pass those matrices by reference instead of by value to speed it up?
-.....are they passed by value or reference in the first place?
*/

/*
A: Matrix representing path of a word; array of frames, where frames are array of points
B: Matrix representing path of a query
memo: DP table of dimensions [A.length+1][B.length+1]
i: how many frames are left in A
j: how many frames are left in B
*/
var INF = 500000;
var memo;
var MAX_SIZE_SCALE = .9;
var MIN_SIZE_SCALE = .9;

function calcSimilarity(word, query) {
  //initialize DP table with zeros. Matrix of size [word.length+1][query.length+1]
  memo = [];
  for(var i = 0; i <= word.length; i++) {
    memo.push([]);
    for(var j = 0; j <= query.length; j++)
      memo[i].push(0);
  }

  // //if query is too short
  // if(query.length < MIN_SIZE_SCALE * word.length) { //must elongate

  // }

  //check if word is of appropriate length
  if(query.length <= MAX_SIZE_SCALE * word.length)
    return dp(word, query, word.length, query.length);
  else { //query is too long, must sample it
    // console.log("Query too long");
    var sampled = [];
    var sampleRate = Math.floor(query.length / Math.abs(word.length - query.length));

    for(var i = 0; i < query.length; i++) {
      //remove/exclude periodic frames
      if(i % sampleRate != 0)
        sampled.push(query[i]);
    }

    return dp(word, sampled, word.length, sampled.length);
  }
}

//helper function, performs DP calculations
function dp(A, B, i, j) {
  if(j == 0) //finished comparing all of B
    return 0;
  else if(i < j) //not enough of A to compare with B, don't continue
    return INF;
  else if(memo[i][j] != 0)
    return memo[i][j];

  var cost = calcDist(A[i-1], B[j-1]);
  memo[i][j] = Math.min(dp(A, B, i-1, j-1) + cost, dp(A, B, i-1, j));

  return memo[i][j];
}

//find sum of squared differences in x and y coordinates of points in 2 frames
function calcDist(frame1, frame2) {
  var sum = 0;
  for(var k = 0; k < frame1.length; k++) { //kth point in both frames
    sum += Math.pow(frame1[k][0] - frame2[k][0], 2) + 
         Math.pow(frame1[k][1] - frame2[k][1], 2);
  }
  return sum;
}

//converts an array of nums into proper format for DP. Debug only
function convertDebugFrame(arr) {
  var converted = [];
  for(var i = 0; i < arr.length; i++) {
    converted[i] = [[arr[i], 0]];
  }
  return converted;
}

//debug version for only a 1D array
function getScore(A, B, i, j) {
  if(j == 0) // finished comparing all of arr2
    return 0;
  else if(i < j) //more arr2 elements left than arr1, can't finish comparing
    return INF;
  else if(memo[i][j] != 0)
    return memo[i][j];

  var cost = Math.pow(A[i-1] - B[j-1], 2);

  var a1 = getScore(A, B, i-1, j-1) + cost;
  var a2 = getScore(A, B, i-1, j);
  memo[i][j] = Math.min(a1, a2);

  return memo[i][j];
}

function getBestWord(queryPath) {
  if(!confirm("Test with this query?"))
    return;
  document.getElementById("chart").style.display = "none";
  document.getElementById("loading").style.display = "block";
  var minScore = INF;
  var bestWord = "NOT FOUND";

  var results = [];
  var halt = true;
  firebase.child("calibrationMatrixList").once("value", function(snapshot) {
    var calib = snapshot.val();
    for(var i = 0; i < calib.length; i++) { //compare against each word
      var entry = calib[i];
      if(entry === "undefined")
      	continue;

      // console.log(entry.word);
      var word = entry.word;

      var wordPath = entry.matrix;
      var score = calcSimilarity(wordPath, queryPath);
      // console.log(score);
      // alert("Word being tested now is: " + dictionary[i] + ". Score: " + score);
      results.push([word, score]);

      if(score < minScore) {
        minScore = score;
        bestWord = word;
      }
    }
    knn(results, 5);
    console.log("Closest when k=1: " + bestWord);
    // alert("Best match: " + bestWord + ". Score: " + minScore);
    document.getElementById("loading").style.display = "none";
    // draw bar chart of best five words
    drawchart(results);
    document.getElementById("chart").style.display = "block";
  });
}

function mode(array)
{
    if(array.length == 0)
    	return null;
    var modeMap = {};
    var maxEl = array[0], maxCount = 1;
    for(var i = 0; i < array.length; i++)
    {
    	var el = array[i];
    	if(modeMap[el] == null)
    		modeMap[el] = 1;
    	else
    		modeMap[el]++;	
    	if(modeMap[el] > maxCount)
    	{
    		maxEl = el;
    		maxCount = modeMap[el];
    	}
    }

    return maxEl;
}

function knn(results, k)
{
	// k=1;
	//get top k matches
	results.sort(sortfunction);
	var neighbors = [];
	for(var i = 0; i < k; i++)
		neighbors.push(results[i][0]);

	console.log("For k=5: " + mode(neighbors));
	document.getElementById("bestMatch").innerHTML = mode(neighbors);	
}

var noseRecorded = false;
function recordNoseLength(currPos) {
  //record only once
  if(noseRecorded)
    return;
  noseRecorded = true;

  var length = Math.abs(currPos[33][1] - currPos[62][1]); //length of nose bridge

  //put in firebase
  firebase.child("noseLength").set(length);
}

function sortfunction(a,b) {
  if (a[1] == b[1]) {
    return 0;
  } else {
    return (a[1] < b[1]) ? -1:1;
  }
}

function getcol(matrix, col) {
  var vec = [];
  var len = Math.min(matrix.length,5);
  for (var i=0; i<len; i++) {
    vec[vec.length] = matrix[i][col];
  }
  return vec;
}

function drawchart(results) {
  // sort results from best to worst score
  results.sort(sortfunction);
  var words = getcol(results, 0);
  var scores = getcol(results, 1);
  $('#chart').highcharts({
    chart: {
      type: 'bar'
    },
    title: {
      text: 'Best Matching Words'
    },
    subtitle: {
      text: 'best match has lowest score'
    },
    xAxis: {
      categories: words,
      title: {text: null}
    },
    yAxis: {
      min: 0,
      title: {
        text: 'Score',
        align: 'high'
      },
      labels: {
        overflow: 'justify'
      }
    },
    credits: {
      enabled: false
    },
    series: [{
      showInLegend: false,
      name: 'Score',
      data: scores
    }]
  });
}
