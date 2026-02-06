// Sample stub data (replace with API later)
const sample = {
  totals: {
    enrollments: 1248,
    births: 312,
    oral: 528,
    ultrasound: 874
  },
  weeks: ["Wk-35","Wk-36","Wk-37","Wk-38","Wk-39","Wk-40","Wk-41","Wk-42"],
  enrollWeekly: [110,125,118,140,150,162,158,185],
  oralWeekly: [60,72,68,75,88,94,90,106],
  ageGroups: { labels: ["15-19","20-24","25-29","30-34","35-39","40+"], values: [52, 238, 402, 356, 152, 48] },
  placeDelivery: { labels: ["Home","Maiti","Healthpost/Clinic","Hospital"], values: [22, 8, 106, 176] },
  deliveryType: { labels: ["Vaginal","C-section"], values: [238, 74] }
};

// Assign totals
document.getElementById('statEnrollments').textContent = sample.totals.enrollments.toLocaleString();
document.getElementById('statBirths').textContent = sample.totals.births.toLocaleString();
document.getElementById('statOral').textContent = sample.totals.oral.toLocaleString();
document.getElementById('statUltrasound').textContent = sample.totals.ultrasound.toLocaleString();

// Chart helpers
const withGrid = (gridColor='rgba(0,0,0,.06)') => ({
  grid: { color: gridColor, drawBorder: false, borderDash: [4,4] },
  ticks: { color: '#6c757d' }
});
const baseOpts = (title) => ({
  responsive: true,
  maintainAspectRatio: false,
  plugins: {
    legend: { display: false },
    tooltip: { mode: 'index', intersect: false, backgroundColor: 'rgba(3,62,138,.9)' },
    title: { display: false, text: title }
  },
  scales: {
    x: withGrid(),
    y: withGrid(),
  }
});

// Colors (let Chart.js pick defaults for datasets; avoid hardcoding multiple colors)
const ctxEW = document.getElementById('chartEnrollWeekly').getContext('2d');
new Chart(ctxEW, {
  type: 'line',
  data: {
    labels: sample.weeks,
    datasets: [{ label: 'Enrollments', data: sample.enrollWeekly, tension:.35, fill:true }]
  },
  options: baseOpts('Weekly Enrollment')
});

const ctxOW = document.getElementById('chartOralWeekly').getContext('2d');
new Chart(ctxOW, {
  type: 'line',
  data: {
    labels: sample.weeks,
    datasets: [{ label: 'Oral Assessments', data: sample.oralWeekly, tension:.35, fill:true }]
  },
  options: baseOpts('Weekly Oral Assessments')
});

const ctxAG = document.getElementById('chartAgeGroup').getContext('2d');
new Chart(ctxAG, {
  type: 'bar',
  data: {
    labels: sample.ageGroups.labels,
    datasets: [{ label: 'Enrollments', data: sample.ageGroups.values, borderWidth: 1 }]
  },
  options: baseOpts('Age Group')
});

const ctxPD = document.getElementById('chartPlaceDelivery').getContext('2d');
new Chart(ctxPD, {
  type: 'doughnut',
  data: {
    labels: sample.placeDelivery.labels,
    datasets: [{ label: 'Deliveries', data: sample.placeDelivery.values }]
  },
  options: { responsive:true, maintainAspectRatio:false, plugins:{ legend:{ position:'bottom' } } }
});

const ctxDT = document.getElementById('chartDeliveryType').getContext('2d');
new Chart(ctxDT, {
  type: 'doughnut',
  data: {
    labels: sample.deliveryType.labels,
    datasets: [{ label: 'Type', data: sample.deliveryType.values }]
  },
  options: { responsive:true, maintainAspectRatio:false, plugins:{ legend:{ position:'bottom' } } }
});
