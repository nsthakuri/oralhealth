// Sidebar toggle for mobile
const sidebar = document.getElementById('sidebar');
document.getElementById('sidebarToggle')?.addEventListener('click', () => {
  sidebar.classList.toggle('collapsed');
});

// Filter menu items by text
const menuFilter = document.getElementById('menuFilter');
const menuList = document.getElementById('menuList');
if (menuFilter && menuList){
  menuFilter.addEventListener('input', (e) => {
    const q = e.target.value.toLowerCase().trim();
    menuList.querySelectorAll('.nav-item').forEach(li => {
      const text = li.querySelector('.nav-link span')?.textContent.toLowerCase() || '';
      li.style.display = text.includes(q) ? '' : 'none';
    });
  });
}

// Global search mirrors filter
const globalSearch = document.getElementById('globalSearch');
if (globalSearch){
  globalSearch.addEventListener('input', (e) => {
    menuFilter.value = e.target.value;
    menuFilter.dispatchEvent(new Event('input'));
  });
}

// Active state for sidebar
menuList?.querySelectorAll('.nav-link').forEach(a => {
  a.addEventListener('click', (ev) => {
    menuList.querySelectorAll('.nav-link').forEach(x => x.classList.remove('active'));
    a.classList.add('active');
    if (window.innerWidth < 992) sidebar.classList.add('collapsed');
  });
});
