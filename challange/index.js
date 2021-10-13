const array = [0, 1, 2, 3, 4, 789, 800, 1, 2, 3, 4, 5, 6, 790];

function findSecondBiggest(arr) {
	let biggest = arr[0];
	let secondBiggest = arr[0];
	arr.forEach(e => {
		if (e > biggest) {
			secondBiggest = biggest;
			biggest = e;
		} else if (e > secondBiggest) {
			secondBiggest = e;
		}
	});

	console.log(secondBiggest);
}

findSecondBiggest(array);