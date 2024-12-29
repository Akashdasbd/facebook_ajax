// Select all elements with ID showSubitem
const showSubitems = document.querySelectorAll("#showSubitem");

// Function to handle click outside the showSubitem area
function handleClickOutside(e) {
  // Check if the click is outside
  showSubitems.forEach((item) => {
    if (
      !item.contains(e.target) &&
      !item.previousElementSibling.contains(e.target)
    ) {
      item.previousElementSibling.classList.remove("showSubitem");
    }
  });
}

// Add event listeners to all showSubitems
showSubitems.forEach((item) => {
  item.addEventListener("click", function (e) {
    // remove the class from all items
    showSubitems.forEach((item) => {
      item.previousElementSibling.classList.remove("showSubitem");
    });

    item.previousElementSibling.classList.add("showSubitem");
    e.stopPropagation();
  });
});

// detect clicks outside
document.addEventListener("click", handleClickOutside);


function timeAgo(timestamp) {
  const now = Date.now() / 1000; // Convert milliseconds to seconds
  const timeDifference = now - timestamp;

  if (timeDifference < 1) {
    return 'just now';
  }

  const timeIntervals = [
    [31536000, 'year'], // 1 year in seconds
    [2592000, 'month'], // 1 month in seconds (approximately)
    [86400, 'day'],
    [3600, 'hour'],
    [60, 'minute'],
    [1, 'second']
  ];

  for (const [seconds, unit] of timeIntervals) {
    const interval = Math.floor(timeDifference / seconds);
    if (interval >= 1) {
      return `${interval} ${unit}${interval > 1 ? 's' : ''} ago`;
    }
  }
}
