/* ============================================================
   BANTUKASIR DESIGN SYSTEM — Interactive Script
   ============================================================ */

document.addEventListener('DOMContentLoaded', () => {

    /* ─────────────────────────────────────────────
       2. SINGLE SECTION NAVIGATION (SPA Mode)
       Replacing Scroll-to-Section with Switch-Section
    ───────────────────────────────────────────── */
    const navItems = document.querySelectorAll('.nav-item[data-target]');
    const sidebar = document.getElementById('sidebar');
    const sections = document.querySelectorAll('.ds-section');
    const banners = document.querySelectorAll('.ds-category-banner');
    const dividers = document.querySelectorAll('.ds-divider');

    function navigateToSection(targetId) {
        if (!targetId) return;
        const targetSection = document.getElementById(targetId);
        if (!targetSection) return;

        // 1. Hide everything everywhere
        sections.forEach(s => s.classList.remove('is-active'));
        banners.forEach(b => b.classList.remove('is-active'));
        dividers.forEach(d => d.style.display = 'none');

        // 2. Show the target section
        targetSection.classList.add('is-active');

        // 3. Update sidebar active state
        navItems.forEach(item => {
            item.classList.toggle('active', item.getAttribute('data-target') === targetId);
        });

        // 4. Scroll main content to top
        window.scrollTo({ top: 0, behavior: 'auto' });

        // 5. Close mobile sidebar
        sidebar.classList.remove('is-open');

        // 6. Push state to URL (optional but nice)
        // history.pushState(null, null, `#${targetId}`);
    }

    // Attach to sidebar items
    navItems.forEach(item => {
        item.addEventListener('click', () => {
            navigateToSection(item.getAttribute('data-target'));
        });
    });

    // Overview Category Cards Integration
    const categoryCards = document.querySelectorAll('.ds-category-card');
    categoryCards.forEach(card => {
        card.addEventListener('click', () => {
            const category = card.getAttribute('data-category');
            const mapping = {
                'foundation': 'section-colors',
                'komponen': 'section-buttons',
                'patterns': 'section-layout'
            };
            navigateToSection(mapping[category]);
        });
    });

    // Initial State: Load Overview
    navigateToSection('section-overview');



    /* ─────────────────────────────────────────────
       3. MOBILE MENU TOGGLE
    ───────────────────────────────────────────── */
    const mobileToggle = document.getElementById('mobileMenuToggle');

    mobileToggle.addEventListener('click', () => {
        sidebar.classList.toggle('is-open');
    });

    // Close sidebar on outside click (mobile)
    document.addEventListener('click', (e) => {
        if (window.innerWidth <= 768 &&
            sidebar.classList.contains('is-open') &&
            !sidebar.contains(e.target) &&
            e.target !== mobileToggle) {
            sidebar.classList.remove('is-open');
        }
    });


    /* ─────────────────────────────────────────────
       4. SEARCH / FILTER SIDEBAR ITEMS
    ───────────────────────────────────────────── */
    const searchInput = document.getElementById('searchInput');

    searchInput.addEventListener('input', () => {
        const query = searchInput.value.toLowerCase().trim();

        navItems.forEach(item => {
            const text = item.textContent.toLowerCase();
            // Show/hide nav item based on query
            item.style.display = (query === '' || text.includes(query)) ? '' : 'none';
        });

        // Also handle sidebar headers (Foundation, Komponen, etc.)
        sectionTitles.forEach(title => {
            const list = title.nextElementSibling;
            if (list && list.classList.contains('nav-list')) {
                // If all children are hidden, hide the header
                const items = list.querySelectorAll('.nav-item');
                const hasVisibleItem = Array.from(items).some(i => i.style.display !== 'none');
                title.style.display = (query === '' || hasVisibleItem) ? '' : 'none';
                
                // If there's a query and matches, ensure section is expanded
                if (query !== '' && hasVisibleItem) {
                    title.classList.remove('is-collapsed');
                    list.classList.remove('is-collapsed');
                }
            }
        });
    });





















    /* ─────────────────────────────────────────────
       11. COLOR SWATCH COPY-TO-CLIPBOARD
    ───────────────────────────────────────────── */
    document.querySelectorAll('.color-swatch').forEach(swatch => {
        swatch.style.cursor = 'pointer';
        swatch.title = 'Klik untuk menyalin kode warna';

        swatch.addEventListener('click', () => {
            const fill = swatch.querySelector('.swatch-fill');
            const bgColor = fill.style.backgroundColor;

            // Convert rgb(r,g,b) to hex
            const hex = rgbToHex(bgColor);
            navigator.clipboard.writeText(hex).then(() => {
                alert(`Warna ${hex} disalin!`);
            }).catch(() => {
                alert(`Warna: ${hex}`);
            });
        });
    });

    function rgbToHex(rgb) {
        if (rgb.startsWith('#')) return rgb;
        const match = rgb.match(/\d+/g);
        if (!match) return rgb;
        const [r, g, b] = match.map(Number);
        return '#' + [r, g, b].map(x => x.toString(16).padStart(2, '0')).join('');
    }


    /* ─────────────────────────────────────────────
       UTILITY: Throttle function
    ───────────────────────────────────────────── */
    function throttle(fn, delay) {
        let timer = null;
        return function (...args) {
            if (timer) return;
            timer = setTimeout(() => {
                fn.apply(this, args);
                timer = null;
            }, delay);
        };
    }





    /* ─────────────────────────────────────────────
       13. COLLAPSIBLE SIDEBAR CATEGORIES
    ───────────────────────────────────────────── */
    const sectionTitles = document.querySelectorAll('.sidebar-section-title');

    sectionTitles.forEach(title => {
        // Initially, we can have them expanded or collapsed. 
        // Let's keep them expanded by default as per CSS (max-height: 1000px).

        title.addEventListener('click', () => {
            const list = title.nextElementSibling;
            if (list && list.classList.contains('nav-list')) {
                const isItemCollapsed = list.classList.contains('is-collapsed');
                
                // Toggle classes
                title.classList.toggle('is-collapsed');
                list.classList.toggle('is-collapsed');
            }
        });
    });

});

