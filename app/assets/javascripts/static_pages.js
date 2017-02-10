$(document).ready(function () {
  var ctx = document.getElementById('myChart');
  var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ["Insurance", "Maintenance", "Taxes and Fees", "Financing", "Depreciation", "Fuel", "Tax Credit"], //insert column values here
      datasets: [{
        label: 'Other Car',
        data: [1500, 1700, 500, 7000, 800, 800, 0], //insert tco values here
        backgroundColor: 'rgba(51, 51, 51, 0.8)',
        borderColor: 'rgba(51, 51, 51, 1)',
        borderWidth: 1
      },{
        label: 'Tesla',
        data: [1200, 1900, 300, 5000, 200, 300, 5000], //insert tesla values here
        backgroundColor: 'rgba(204, 0, 0, 0.8)',
        borderColor: 'rgba(204, 0, 0, 1)',
        borderWidth: 1
      }]
    },
    options: {
      maintainAspectRatio: true,
      title: {
            display: true,
            text: 'Other Car vs Tesla',
            fontSize: 24
        },
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true,
            stepSize: 1000
          }
        }]
      }
    }
  });
});
