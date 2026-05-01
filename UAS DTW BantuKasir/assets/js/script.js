// ============================================
//  BANTUKASIR - ENHANCED INTERACTIVE SCRIPTS
// ============================================

document.addEventListener("DOMContentLoaded", () => {
  // ===============================
  //  Promo Bar Countdown
  // ===============================
  const promoBar = document.getElementById("promoBar");
  const promoClose = document.getElementById("promoClose");
  const countdownEl = document.getElementById("countdown");

  let countdownTime = 23 * 3600 + 59 * 60 + 59; // 23:59:59 in seconds

  function updateCountdown() {
    const hours = Math.floor(countdownTime / 3600);
    const minutes = Math.floor((countdownTime % 3600) / 60);
    const seconds = countdownTime % 60;
    countdownEl.textContent = `${String(hours).padStart(2, "0")}:${String(minutes).padStart(2, "0")}:${String(seconds).padStart(2, "0")}`;

    if (countdownTime > 0) {
      countdownTime--;
    }
  }

  setInterval(updateCountdown, 1000);
  updateCountdown();

  promoClose?.addEventListener("click", () => {
    promoBar.classList.add("hidden");
    setTimeout(() => {
      promoBar.style.display = "none";
    }, 300);
  });

  // ===============================
  //  Navbar Scroll Effect
  // ===============================
  const navbar = document.getElementById("navbar");
  let lastScroll = 0;

  window.addEventListener("scroll", () => {
    const currentScroll = window.pageYOffset;

    if (currentScroll > 50) {
      navbar.classList.add("scrolled");
    } else {
      navbar.classList.remove("scrolled");
    }

    if (currentScroll > lastScroll && currentScroll > 200) {
      navbar.style.transform = "translateY(-100%)";
    } else {
      navbar.style.transform = "translateY(0)";
    }

    lastScroll = currentScroll;
  });

  // ===============================
  //  Mobile Menu
  // ===============================
  const mobileMenuBtn = document.getElementById("mobileMenuBtn");
  const mobileMenuOverlay = document.getElementById("mobileMenuOverlay");
  const mobileMenuClose = document.getElementById("mobileMenuClose");

  function openMobileMenu() {
    mobileMenuOverlay.classList.add("active");
    document.body.style.overflow = "hidden";
  }

  function closeMobileMenu() {
    mobileMenuOverlay.classList.remove("active");
    document.body.style.overflow = "";
  }

  mobileMenuBtn?.addEventListener("click", openMobileMenu);
  mobileMenuClose?.addEventListener("click", closeMobileMenu);
  mobileMenuOverlay?.addEventListener("click", (e) => {
    if (e.target === mobileMenuOverlay) closeMobileMenu();
  });

  // Close mobile menu on link click
  document.querySelectorAll(".mobile-nav-links a").forEach((link) => {
    link.addEventListener("click", closeMobileMenu);
  });

  // ===============================
  //  Hero Carousel
  // ===============================
  const slides = document.querySelectorAll(".carousel-slide");
  const dots = document.querySelectorAll(".dot");
  const prevBtn = document.querySelector(".carousel-prev");
  const nextBtn = document.querySelector(".carousel-next");
  let currentSlide = 0;
  let slideInterval;

  function showSlide(index) {
    slides.forEach((slide, i) => {
      slide.classList.toggle("active", i === index);
      dots[i]?.classList.toggle("active", i === index);
    });
    currentSlide = index;
  }

  function nextSlide() {
    showSlide((currentSlide + 1) % slides.length);
  }

  function prevSlide() {
    showSlide((currentSlide - 1 + slides.length) % slides.length);
  }

  function startAutoSlide() {
    slideInterval = setInterval(nextSlide, 5000);
  }

  function stopAutoSlide() {
    clearInterval(slideInterval);
  }

  nextBtn?.addEventListener("click", () => {
    stopAutoSlide();
    nextSlide();
    startAutoSlide();
  });

  prevBtn?.addEventListener("click", () => {
    stopAutoSlide();
    prevSlide();
    startAutoSlide();
  });

  dots.forEach((dot, index) => {
    dot.addEventListener("click", () => {
      stopAutoSlide();
      showSlide(index);
      startAutoSlide();
    });
  });

  startAutoSlide();

  // ===============================
  //  Animated Counter
  // ===============================
  const statNumbers = document.querySelectorAll(".stat-number[data-target]");

  const counterObserver = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          const target = parseFloat(entry.target.dataset.target);
          const isDecimal = target % 1 !== 0;
          const duration = 2000;
          const start = 0;
          const startTime = performance.now();

          function updateCounter(currentTime) {
            const elapsed = currentTime - startTime;
            const progress = Math.min(elapsed / duration, 1);
            const easeOut = 1 - Math.pow(1 - progress, 3);
            const current = start + (target - start) * easeOut;

            if (isDecimal) {
              entry.target.textContent = current.toFixed(1) + "%";
            } else if (target >= 1000000) {
              entry.target.textContent = (current / 1000000).toFixed(0) + "M+";
            } else if (target >= 1000) {
              entry.target.textContent = (current / 1000).toFixed(0) + "K+";
            } else {
              entry.target.textContent = Math.floor(current) + "+";
            }

            if (progress < 1) {
              requestAnimationFrame(updateCounter);
            }
          }

          requestAnimationFrame(updateCounter);
          counterObserver.unobserve(entry.target);
        }
      });
    },
    { threshold: 0.5 },
  );

  statNumbers.forEach((num) => counterObserver.observe(num));

  // ===============================
  //  Business Tabs
  // ===============================
  const businessTabs = document.querySelectorAll(".business-tab");
  const businessContents = document.querySelectorAll(".business-content");

  businessTabs.forEach((tab) => {
    tab.addEventListener("click", () => {
      const target = tab.dataset.business;

      businessTabs.forEach((t) => t.classList.remove("active"));
      businessContents.forEach((c) => c.classList.remove("active"));

      tab.classList.add("active");
      document.getElementById(target)?.classList.add("active");
    });
  });

  // ===============================
  //  Dashboard Navigation
  // ===============================
  const navItems = document.querySelectorAll(".nav-item");
  const contents = document.querySelectorAll(".dashboard-content");

  navItems.forEach((item) => {
    item.addEventListener("click", function () {
      const targetId = this.getAttribute("data-target");

      navItems.forEach((nav) => nav.classList.remove("active"));
      this.classList.add("active");

      contents.forEach((content) => {
        content.classList.remove("active");
        if (content.id === targetId) {
          content.classList.add("active");
        }
      });
    });
  });

  // ===============================
  //  Demo Section Navigation
  // ===============================
  const demoNavItems = document.querySelectorAll(".demo-nav-item");
  const demoScreens = document.querySelectorAll(".demo-screen");

  demoNavItems.forEach((item) => {
    item.addEventListener("click", () => {
      const target = item.dataset.demo;

      demoNavItems.forEach((nav) => nav.classList.remove("active"));
      demoScreens.forEach((screen) => screen.classList.remove("active"));

      item.classList.add("active");
      document.getElementById(`demo-${target}`)?.classList.add("active");
    });
  });

  // ===============================
  //  POS Demo Functionality
  // ===============================
  let cart = [];
  const cartItemsEl = document.getElementById("cartItems");
  const cartCountEl = document.getElementById("cartCount");
  const cartTotalEl = document.getElementById("cartTotal");

  window.addToCart = function (element) {
    const name = element.querySelector(".pos-product-name").textContent;
    const priceText = element.querySelector(".pos-product-price").textContent;
    const price = parseInt(priceText.replace(/[^0-9]/g, ""));

    const existingItem = cart.find((item) => item.name === name);
    if (existingItem) {
      existingItem.qty++;
    } else {
      cart.push({ name, price, qty: 1 });
    }

    updateCart();

    // Visual feedback
    element.style.transform = "scale(0.95)";
    setTimeout(() => {
      element.style.transform = "";
    }, 150);
  };

  window.processPayment = function () {
    if (cart.length === 0) {
      alert("Keranjang masih kosong!");
      return;
    }

    const total = cart.reduce((sum, item) => sum + item.price * item.qty, 0);
    alert(`Pembayaran berhasil!\nTotal: Rp ${total.toLocaleString("id-ID")}\n\nTerima kasih telah mencoba demo BantuKasir POS.`);
    cart = [];
    updateCart();
  };

  function updateCart() {
    if (cart.length === 0) {
      cartItemsEl.innerHTML = `
        <div class="pos-cart-empty">
          <i class="fas fa-cart-plus"></i>
          <p>Klik produk untuk menambahkan</p>
        </div>
      `;
      cartCountEl.textContent = "0 items";
      cartTotalEl.textContent = "Rp 0";
      return;
    }

    const totalItems = cart.reduce((sum, item) => sum + item.qty, 0);
    const totalPrice = cart.reduce((sum, item) => sum + item.price * item.qty, 0);

    cartCountEl.textContent = `${totalItems} item${totalItems > 1 ? "s" : ""}`;
    cartTotalEl.textContent = `Rp ${totalPrice.toLocaleString("id-ID")}`;

    cartItemsEl.innerHTML = cart
      .map(
        (item) => `
      <div class="pos-cart-item">
        <div class="pos-cart-item-info">
          <div class="pos-cart-item-name">${item.name}</div>
          <div class="pos-cart-item-qty">${item.qty}x @ Rp ${item.price.toLocaleString("id-ID")}</div>
        </div>
        <div class="pos-cart-item-price">Rp ${(item.price * item.qty).toLocaleString("id-ID")}</div>
      </div>
    `,
      )
      .join("");
  }

  // ===============================
  //  Pricing Toggle
  // ===============================
  const billingToggle = document.getElementById("billingToggle");
  const monthlyLabel = document.getElementById("monthlyLabel");
  const yearlyLabel = document.getElementById("yearlyLabel");
  const priceAmounts = document.querySelectorAll(".pricing-price .amount");

  billingToggle?.addEventListener("change", () => {
    const isYearly = billingToggle.checked;

    monthlyLabel.classList.toggle("active", !isYearly);
    yearlyLabel.classList.toggle("active", isYearly);

    priceAmounts.forEach((amount) => {
      const price = isYearly ? amount.dataset.yearly : amount.dataset.monthly;
      amount.textContent = parseInt(price).toLocaleString("id-ID");
    });
  });

  // ===============================
  //  Sticky CTA
  // ===============================
  const stickyCta = document.getElementById("stickyCta");

  window.addEventListener("scroll", () => {
    if (window.pageYOffset > 800) {
      stickyCta.classList.add("visible");
    } else {
      stickyCta.classList.remove("visible");
    }
  });

  // ===============================
  //  Scroll Animation
  // ===============================
  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.style.transition = "all 0.6s cubic-bezier(0.22,1,0.36,1)";
          entry.target.style.opacity = "1";
          entry.target.style.transform = "translateY(0)";
        }
      });
    },
    { threshold: 0.1 },
  );

  document.querySelectorAll(".feature-card, .stat-card, .testimonial-card, .pricing-card, .team-card").forEach((el) => {
    el.style.opacity = "0";
    el.style.transform = "translateY(30px)";
    observer.observe(el);
  });

  // ===============================
  //  FAQ Accordion
  // ===============================
  const faqItems = document.querySelectorAll(".faq-item");

  faqItems.forEach((item) => {
    const question = item.querySelector(".faq-question");

    question?.addEventListener("click", () => {
      const isActive = item.classList.contains("active");
      faqItems.forEach((otherItem) => otherItem.classList.remove("active"));
      if (!isActive) item.classList.add("active");
    });
  });

  // ===============================
  //  Smooth Scroll
  // ===============================
  document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
    anchor.addEventListener("click", function (e) {
      e.preventDefault();
      const target = document.querySelector(this.getAttribute("href"));
      if (target) {
        const offset = navbar.offsetHeight + (promoBar?.offsetHeight || 0);
        window.scrollTo({
          top: target.offsetTop - offset,
          behavior: "smooth",
        });
      }
    });
  });

  // ===============================
  //  Button Ripple Effect
  // ===============================
  document.querySelectorAll(".btn").forEach((button) => {
    button.addEventListener("click", function (e) {
      const rect = this.getBoundingClientRect();
      const ripple = document.createElement("span");

      ripple.style.left = `${e.clientX - rect.left}px`;
      ripple.style.top = `${e.clientY - rect.top}px`;
      ripple.classList.add("ripple");

      this.appendChild(ripple);
      setTimeout(() => ripple.remove(), 600);
    });
  });

  // ===============================
  //  Table Row Interaction
  // ===============================
  document.querySelectorAll(".data-table tbody tr").forEach((row) => {
    row.addEventListener("click", function () {
      document.querySelectorAll(".data-table tbody tr").forEach((r) => {
        r.style.background = "";
      });
      this.style.background = "var(--primary-light)";
    });
  });

  // ===============================
  //  Keyboard Navigation
  // ===============================
  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape") {
      closeMobileMenu();
    }
  });

  console.log("🚀 BantuKasir UI Enhanced - Version 2.0 Loaded!");
});

/* ============================================
  BANTUKASIR POS DASHBOARD SCRIPT
   Tambahkan ke script.js Anda atau link terpisah
   ============================================ */

(function () {
  "use strict";

  // Data dari MySQL (hardcoded berdasarkan dummy data)
  const DB_DATA = {
    dailySales: [
      { date: "01 Mar", revenue: 470000, transactions: 5 },
      { date: "02 Mar", revenue: 308000, transactions: 5 },
      { date: "03 Mar", revenue: 388500, transactions: 5 },
      { date: "04 Mar", revenue: 551000, transactions: 5 },
      { date: "05 Mar", revenue: 236000, transactions: 5 },
      { date: "06 Mar", revenue: 355000, transactions: 5 },
      { date: "07 Mar", revenue: 524000, transactions: 5 },
      { date: "08 Mar", revenue: 388000, transactions: 5 },
      { date: "09 Mar", revenue: 322000, transactions: 5 },
      { date: "10 Mar", revenue: 547000, transactions: 5 },
      { date: "11 Mar", revenue: 388000, transactions: 5 },
      { date: "12 Mar", revenue: 281000, transactions: 5 },
      { date: "13 Mar", revenue: 370000, transactions: 5 },
      { date: "14 Mar", revenue: 555000, transactions: 5 },
      { date: "15 Mar", revenue: 371000, transactions: 5 },
      { date: "16 Mar", revenue: 443000, transactions: 5 },
      { date: "17 Mar", revenue: 388000, transactions: 5 },
      { date: "18 Mar", revenue: 555000, transactions: 5 },
      { date: "19 Mar", revenue: 323000, transactions: 5 },
      { date: "20 Mar", revenue: 660000, transactions: 5 },
    ],
    paymentMethods: [
      { method: "CASH", count: 50, color: "#10b981" },
      { method: "CASHLESS", count: 50, color: "#3b82f6" },
    ],
    categories: [
      { name: "Makanan Ringan", sales: 1250000 },
      { name: "Minuman", sales: 980000 },
      { name: "Elektronik", sales: 3200000 },
      { name: "Pakaian", sales: 850000 },
      { name: "Kebutuhan Dapur", sales: 720000 },
      { name: "Lainnya", sales: 2575000 },
    ],
    topProducts: [
      { name: "Cincin Emas", sold: 1, revenue: 2500000 },
      { name: "Rice Cooker 1.8L", sold: 15, revenue: 350000 },
      { name: "Headphone Bluetooth", sold: 25, revenue: 450000 },
      { name: "Beras Premium 5kg", sold: 40, revenue: 75000 },
      { name: "Air Mineral 600ml", sold: 500, revenue: 4000 },
    ],
    lowStock: [
      { name: "Cincin Emas", sku: "ELC-001", qty: 1 },
      { name: "Rice Cooker 1.8L", sku: "ERH-001", qty: 15 },
      { name: "Headphone Bluetooth", sku: "ELC-002", qty: 25 },
      { name: "Blender Jus 2 Speed", sku: "ERH-003", qty: 12 },
      { name: "Mixer Kue Handheld", sku: "ERH-005", qty: 10 },
    ],
    recentTransactions: [
      {
        id: "#TRX-100",
        time: "20 Mar 17:50",
        customer: "cust100@email.com",
        cashier: "Sari Indah",
        total: 450000,
        status: "Lunas",
      },
      {
        id: "#TRX-099",
        time: "20 Mar 16:55",
        customer: "cust99@email.com",
        cashier: "Eko Susanto",
        total: 350000,
        status: "Lunas",
      },
      {
        id: "#TRX-098",
        time: "20 Mar 14:30",
        customer: "cust98@email.com",
        cashier: "Citra Kirana",
        total: 275000,
        status: "Lunas",
      },
      {
        id: "#TRX-097",
        time: "20 Mar 12:15",
        customer: "cust97@email.com",
        cashier: "Bima Sakti",
        total: 65000,
        status: "Pending",
      },
      {
        id: "#TRX-096",
        time: "20 Mar 10:40",
        customer: "cust96@email.com",
        cashier: "Dwi Putra",
        total: 15000,
        status: "Lunas",
      },
      {
        id: "#TRX-095",
        time: "19 Mar 17:30",
        customer: "cust95@email.com",
        cashier: "Sari Indah",
        total: 48000,
        status: "Lunas",
      },
      {
        id: "#TRX-094",
        time: "19 Mar 15:20",
        customer: "cust94@email.com",
        cashier: "Eko Susanto",
        total: 30000,
        status: "Batal",
      },
    ],
    stores: [
      { code: "STORE01", orders: 38, revenue: 3585000 },
      { code: "STORE02", orders: 34, revenue: 3120000 },
      { code: "STORE03", orders: 28, revenue: 2870000 },
    ],
    employees: [
      {
        name: "Budi Santoso",
        role: "Kasir STORE01",
        sales: 450000,
        color: "#10b981",
      },
      {
        name: "Siti Aminah",
        role: "Kasir STORE01",
        sales: 380000,
        color: "#3b82f6",
      },
      {
        name: "Andi Wijaya",
        role: "Kasir STORE02",
        sales: 350000,
        color: "#f59e0b",
      },
      {
        name: "Dewi Lestari",
        role: "Kasir STORE02",
        sales: 320000,
        color: "#8b5cf6",
      },
      {
        name: "Eko Prasetyo",
        role: "Kasir STORE03",
        sales: 290000,
        color: "#ef4444",
      },
    ],
  };

  // Utility: Format Rupiah
  function formatRupiah(num) {
    if (num >= 1000000) {
      return "Rp " + (num / 1000000).toFixed(1).replace(".", ",") + "M";
    } else if (num >= 1000) {
      return "Rp " + (num / 1000).toFixed(0) + "K";
    }
    return "Rp " + num.toLocaleString("id-ID");
  }

  // Utility: Format number
  function formatNumber(num) {
    return num.toLocaleString("id-ID");
  }

  // ============================================
  // 1. Animated Counters
  // ============================================
  function initCounters() {
    const counters = document.querySelectorAll(".db-stat-value[data-target]");

    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            const el = entry.target;
            const target = parseFloat(el.dataset.target);
            const prefix = el.dataset.prefix || "";
            const suffix = el.dataset.suffix || "";
            const duration = 2000;
            const startTime = performance.now();

            function update(currentTime) {
              const elapsed = currentTime - startTime;
              const progress = Math.min(elapsed / duration, 1);
              const easeOut = 1 - Math.pow(1 - progress, 3);
              const current = target * easeOut;

              el.textContent = prefix + formatNumber(Math.floor(current)) + suffix;

              if (progress < 1) {
                requestAnimationFrame(update);
              } else {
                el.textContent = prefix + formatNumber(target) + suffix;
              }
            }

            requestAnimationFrame(update);
            observer.unobserve(el);
          }
        });
      },
      { threshold: 0.5 },
    );

    counters.forEach((counter) => observer.observe(counter));
  }

  // ============================================
  // 2. Canvas Chart Helper
  // ============================================
  function createCanvas(id) {
    const canvas = document.getElementById(id);
    if (!canvas) return null;
    const ctx = canvas.getContext("2d");
    const dpr = window.devicePixelRatio || 1;
    const rect = canvas.getBoundingClientRect();
    canvas.width = rect.width * dpr;
    canvas.height = rect.height * dpr;
    ctx.scale(dpr, dpr);
    return { canvas, ctx, width: rect.width, height: rect.height };
  }

  // ============================================
  // 3. Line Chart - Sales Trend
  // ============================================
  function drawSalesTrend() {
    const chart = createCanvas("salesTrendChart");
    if (!chart) return;
    const { ctx, width, height } = chart;
    const data = DB_DATA.dailySales;
    const padding = { top: 20, right: 20, bottom: 40, left: 60 };
    const chartWidth = width - padding.left - padding.right;
    const chartHeight = height - padding.top - padding.bottom;

    const maxRevenue = Math.max(...data.map((d) => d.revenue));
    const maxTrans = Math.max(...data.map((d) => d.transactions));

    ctx.clearRect(0, 0, width, height);

    // Grid lines
    ctx.strokeStyle = "#e2e8f0";
    ctx.lineWidth = 1;
    for (let i = 0; i <= 4; i++) {
      const y = padding.top + (chartHeight / 4) * i;
      ctx.beginPath();
      ctx.moveTo(padding.left, y);
      ctx.lineTo(width - padding.right, y);
      ctx.stroke();
    }

    // Draw Revenue Line
    ctx.strokeStyle = "#10b981";
    ctx.lineWidth = 3;
    ctx.lineCap = "round";
    ctx.lineJoin = "round";
    ctx.beginPath();

    data.forEach((d, i) => {
      const x = padding.left + (chartWidth / (data.length - 1)) * i;
      const y = padding.top + chartHeight - (d.revenue / maxRevenue) * chartHeight;
      if (i === 0) ctx.moveTo(x, y);
      else ctx.lineTo(x, y);
    });
    ctx.stroke();

    // Revenue Area
    ctx.fillStyle = "rgba(16, 185, 129, 0.1)";
    ctx.beginPath();
    data.forEach((d, i) => {
      const x = padding.left + (chartWidth / (data.length - 1)) * i;
      const y = padding.top + chartHeight - (d.revenue / maxRevenue) * chartHeight;
      if (i === 0) ctx.moveTo(x, y);
      else ctx.lineTo(x, y);
    });
    ctx.lineTo(width - padding.right, padding.top + chartHeight);
    ctx.lineTo(padding.left, padding.top + chartHeight);
    ctx.closePath();
    ctx.fill();

    // Draw Transaction Line (secondary axis simulation)
    ctx.strokeStyle = "#fbbf24";
    ctx.lineWidth = 2;
    ctx.setLineDash([5, 5]);
    ctx.beginPath();
    data.forEach((d, i) => {
      const x = padding.left + (chartWidth / (data.length - 1)) * i;
      const y = padding.top + chartHeight - (d.transactions / maxTrans) * chartHeight * 0.6;
      if (i === 0) ctx.moveTo(x, y);
      else ctx.lineTo(x, y);
    });
    ctx.stroke();
    ctx.setLineDash([]);

    // Points
    data.forEach((d, i) => {
      const x = padding.left + (chartWidth / (data.length - 1)) * i;
      const y = padding.top + chartHeight - (d.revenue / maxRevenue) * chartHeight;
      ctx.fillStyle = "#fff";
      ctx.strokeStyle = "#10b981";
      ctx.lineWidth = 2;
      ctx.beginPath();
      ctx.arc(x, y, 4, 0, Math.PI * 2);
      ctx.fill();
      ctx.stroke();
    });

    // X Labels (show every 3rd)
    ctx.fillStyle = "#64748b";
    ctx.font = "600 11px 'Plus Jakarta Sans', sans-serif";
    ctx.textAlign = "center";
    data.forEach((d, i) => {
      if (i % 3 === 0 || i === data.length - 1) {
        const x = padding.left + (chartWidth / (data.length - 1)) * i;
        ctx.fillText(d.date, x, height - 10);
      }
    });

    // Y Labels
    ctx.textAlign = "right";
    ctx.fillStyle = "#94a3b8";
    for (let i = 0; i <= 4; i++) {
      const val = Math.round((maxRevenue / 4) * (4 - i));
      const y = padding.top + (chartHeight / 4) * i + 4;
      ctx.fillText(formatRupiah(val), padding.left - 10, y);
    }
  }

  // ============================================
  // 4. Doughnut Chart - Payment Methods
  // ============================================
  function drawPaymentChart() {
    const chart = createCanvas("paymentChart");
    if (!chart) return;
    const { ctx, width, height } = chart;
    const data = DB_DATA.paymentMethods;
    const total = data.reduce((sum, d) => sum + d.count, 0);
    const centerX = width / 2;
    const centerY = height / 2;
    const radius = Math.min(width, height) / 2 - 20;
    const innerRadius = radius * 0.6;

    let currentAngle = -Math.PI / 2;

    data.forEach((d) => {
      const sliceAngle = (d.count / total) * Math.PI * 2;

      ctx.beginPath();
      ctx.arc(centerX, centerY, radius, currentAngle, currentAngle + sliceAngle);
      ctx.arc(centerX, centerY, innerRadius, currentAngle + sliceAngle, currentAngle, true);
      ctx.closePath();
      ctx.fillStyle = d.color;
      ctx.fill();

      ctx.strokeStyle = "#fff";
      ctx.lineWidth = 3;
      ctx.stroke();

      currentAngle += sliceAngle;
    });

    // Center text
    ctx.fillStyle = "#0f172a";
    ctx.font = "bold 24px 'Sora', sans-serif";
    ctx.textAlign = "center";
    ctx.textBaseline = "middle";
    ctx.fillText(total, centerX, centerY - 8);
    ctx.fillStyle = "#64748b";
    ctx.font = "600 12px 'Plus Jakarta Sans', sans-serif";
    ctx.fillText("Transaksi", centerX, centerY + 12);

    // Metrics below
    const metricsEl = document.getElementById("paymentMetrics");
    if (metricsEl) {
      metricsEl.innerHTML = data
        .map(
          (d) => `
        <div class="db-metric-item">
          <div class="db-metric-value" style="color: ${d.color}">${d.count}</div>
          <div class="db-metric-label">${d.method}</div>
        </div>
      `,
        )
        .join("");
    }
  }

  // ============================================
  // 5. Bar Chart - Category Sales
  // ============================================
  function drawCategoryChart() {
    const chart = createCanvas("categoryChart");
    if (!chart) return;
    const { ctx, width, height } = chart;
    const data = DB_DATA.categories;
    const padding = { top: 20, right: 20, bottom: 60, left: 20 };
    const chartWidth = width - padding.left - padding.right;
    const chartHeight = height - padding.top - padding.bottom;
    const maxSales = Math.max(...data.map((d) => d.sales));
    const barWidth = (chartWidth / data.length) * 0.6;
    const gap = (chartWidth / data.length) * 0.4;

    ctx.clearRect(0, 0, width, height);

    data.forEach((d, i) => {
      const x = padding.left + gap / 2 + (barWidth + gap) * i;
      const barHeight = (d.sales / maxSales) * chartHeight;
      const y = padding.top + chartHeight - barHeight;

      const gradient = ctx.createLinearGradient(0, y, 0, y + barHeight);
      gradient.addColorStop(0, "#10b981");
      gradient.addColorStop(1, "#34d399");
      ctx.fillStyle = gradient;
      ctx.roundRect(x, y, barWidth, barHeight, [4, 4, 0, 0]);
      ctx.fill();

      ctx.fillStyle = "#64748b";
      ctx.font = "600 10px 'Plus Jakarta Sans', sans-serif";
      ctx.textAlign = "center";
      ctx.save();
      ctx.translate(x + barWidth / 2, height - 10);
      ctx.rotate(-Math.PI / 4);
      ctx.fillText(d.name, 0, 0);
      ctx.restore();

      ctx.fillStyle = "#0f172a";
      ctx.font = "700 10px 'Sora', sans-serif";
      ctx.textAlign = "center";
      ctx.fillText(formatRupiah(d.sales), x + barWidth / 2, y - 6);
    });
  }

  // ============================================
  // 6. Top Products List
  // ============================================
  function renderTopProducts() {
    const container = document.getElementById("topProductsList");
    if (!container) return;
    const maxSold = Math.max(...DB_DATA.topProducts.map((p) => p.sold));

    container.innerHTML = DB_DATA.topProducts
      .map((p, i) => {
        const percent = (p.sold / maxSold) * 100;
        return `
        <div class="db-product-bar db-animate" style="animation-delay: ${i * 0.1}s">
          <div class="db-product-rank">${i + 1}</div>
          <div class="db-product-info">
            <span class="db-product-name">${p.name}</span>
            <span class="db-product-meta">${p.sold} unit terjual</span>
            <div class="db-product-progress">
              <div class="db-product-progress-bar" style="width: 0%" data-width="${percent}%"></div>
            </div>
          </div>
          <div class="db-product-sales">${formatRupiah(p.revenue)}</div>
        </div>
      `;
      })
      .join("");

    setTimeout(() => {
      container.querySelectorAll(".db-product-progress-bar").forEach((bar) => {
        bar.style.width = bar.dataset.width;
      });
    }, 300);
  }

  // ============================================
  // 7. Recent Transactions Table
  // ============================================
  function renderRecentTransactions() {
    const tbody = document.querySelector("#recentTransactionsTable tbody");
    if (!tbody) return;

    tbody.innerHTML = DB_DATA.recentTransactions
      .map((t, i) => {
        const statusClass = t.status === "Lunas" ? "success" : t.status === "Pending" ? "warning" : "danger";
        return `
        <tr class="db-animate" style="animation-delay: ${i * 0.05}s">
          <td><strong>${t.id}</strong></td>
          <td>${t.time}</td>
          <td>${t.customer}</td>
          <td>${t.cashier}</td>
          <td><strong>${formatRupiah(t.total)}</strong></td>
          <td><span class="db-status ${statusClass}">${t.status}</span></td>
        </tr>
      `;
      })
      .join("");
  }

  // ============================================
  // 8. Low Stock Table
  // ============================================
  function renderLowStock() {
    const tbody = document.querySelector("#lowStockTable tbody");
    if (!tbody) return;

    tbody.innerHTML = DB_DATA.lowStock
      .map((item, i) => {
        const statusClass = item.qty <= 10 ? "danger" : "warning";
        const statusText = item.qty <= 10 ? "Kritis" : "Menipis";
        return `
        <tr class="db-animate" style="animation-delay: ${i * 0.1}s">
          <td>
            <div style="display:flex;align-items:center;gap:0.75rem">
              <div style="width:32px;height:32px;border-radius:8px;background:var(--gray-100);display:flex;align-items:center;justify-content:center;color:var(--gray-500)">
                <i class="fas fa-box"></i>
              </div>
              <span style="font-weight:700;color:var(--dark)">${item.name}</span>
            </div>
          </td>
          <td style="color:var(--gray-500);font-size:0.85rem">${item.sku}</td>
          <td><strong>${item.qty}</strong></td>
          <td><span class="db-status ${statusClass}">${statusText}</span></td>
        </tr>
      `;
      })
      .join("");
  }

  // ============================================
  // 9. Store Performance Cards
  // ============================================
  function renderStoreCards() {
    const container = document.getElementById("storeCards");
    if (!container) return;

    container.innerHTML = DB_DATA.stores
      .map(
        (s, i) => `
      <div class="db-store-card db-animate" style="animation-delay: ${i * 0.15}s">
        <div class="db-store-icon">
          <i class="fas fa-store"></i>
        </div>
        <div class="db-store-info">
          <div class="db-store-name">${s.code}</div>
          <div class="db-store-meta">${s.orders} transaksi</div>
        </div>
        <div class="db-store-revenue">${formatRupiah(s.revenue)}</div>
      </div>
    `,
      )
      .join("");
  }

  // ============================================
  // 10. Employee Ranking
  // ============================================
  function renderEmployeeRank() {
    const container = document.getElementById("employeeRank");
    if (!container) return;

    container.innerHTML = DB_DATA.employees
      .map(
        (e, i) => `
      <div class="db-employee-item db-animate" style="animation-delay: ${i * 0.1}s">
        <div class="db-employee-avatar" style="background: ${e.color}">
          ${e.name
            .split(" ")
            .map((n) => n[0])
            .join("")}
        </div>
        <div class="db-employee-info">
          <div class="db-employee-name">${e.name}</div>
          <div class="db-employee-role">${e.role}</div>
        </div>
        <div class="db-employee-sales">${formatRupiah(e.sales)}</div>
      </div>
    `,
      )
      .join("");
  }

  // ============================================
  // 11. Sparklines (Mini Charts)
  // ============================================
  function drawSparkline(canvasId, data, color) {
    const canvas = document.getElementById(canvasId);
    if (!canvas) return;
    const ctx = canvas.getContext("2d");
    const dpr = window.devicePixelRatio || 1;
    const rect = canvas.parentElement.getBoundingClientRect();
    canvas.width = rect.width * dpr;
    canvas.height = rect.height * dpr;
    ctx.scale(dpr, dpr);

    const width = rect.width;
    const height = rect.height;
    const max = Math.max(...data);
    const min = Math.min(...data);
    const range = max - min || 1;

    ctx.clearRect(0, 0, width, height);
    ctx.strokeStyle = color;
    ctx.lineWidth = 2;
    ctx.lineCap = "round";
    ctx.lineJoin = "round";
    ctx.beginPath();

    data.forEach((val, i) => {
      const x = (width / (data.length - 1)) * i;
      const y = height - ((val - min) / range) * (height - 10) - 5;
      if (i === 0) ctx.moveTo(x, y);
      else ctx.lineTo(x, y);
    });
    ctx.stroke();

    ctx.lineTo(width, height);
    ctx.lineTo(0, height);
    ctx.closePath();
    if (color === "#10b981") ctx.fillStyle = "rgba(16, 185, 129, 0.1)";
    else if (color === "#3b82f6") ctx.fillStyle = "rgba(59, 130, 246, 0.1)";
    else if (color === "#f59e0b") ctx.fillStyle = "rgba(245, 158, 11, 0.1)";
    else if (color === "#ef4444") ctx.fillStyle = "rgba(239, 68, 68, 0.1)";
    ctx.fill();
  }

  function initSparklines() {
    const revenueData = DB_DATA.dailySales.map((d) => d.revenue);
    const transData = DB_DATA.dailySales.map((d) => d.transactions);
    const prodData = [100, 98, 97, 95, 94, 93, 92, 91, 90, 89, 88, 87, 86, 85, 84, 83, 82, 81, 80, 78];
    const custData = [85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 100, 100, 100, 100];

    drawSparkline("revenueSparkline", revenueData, "#10b981");
    drawSparkline("transactionSparkline", transData, "#3b82f6");
    drawSparkline("productSparkline", prodData, "#f59e0b");
    drawSparkline("customerSparkline", custData, "#10b981");
  }

  // ============================================
  // 12. Filter Interactions
  // ============================================
  function initFilters() {
    const filterBtns = document.querySelectorAll(".db-filter-btn");
    filterBtns.forEach((btn) => {
      btn.addEventListener("click", function () {
        filterBtns.forEach((b) => b.classList.remove("active"));
        this.classList.add("active");
        document.querySelectorAll(".db-chart-container").forEach((el) => {
          el.style.opacity = "0.6";
          setTimeout(() => (el.style.opacity = "1"), 300);
        });
      });
    });

    const storeSelect = document.getElementById("storeFilter");
    if (storeSelect) {
      storeSelect.addEventListener("change", function () {
        document.querySelectorAll(".db-chart-container").forEach((el) => {
          el.style.transform = "scale(0.98)";
          setTimeout(() => (el.style.transform = ""), 200);
        });
      });
    }
  }

  // ============================================
  // 13. Scroll Animation Observer
  // ============================================
  function initScrollAnimations() {
    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            entry.target.style.animationPlayState = "running";
          }
        });
      },
      { threshold: 0.1 },
    );

    document.querySelectorAll(".db-animate").forEach((el) => {
      el.style.animationPlayState = "paused";
      observer.observe(el);
    });
  }

  // ============================================
  // 14. Responsive Chart Redraw
  // ============================================
  let resizeTimeout;
  window.addEventListener("resize", () => {
    clearTimeout(resizeTimeout);
    resizeTimeout = setTimeout(() => {
      drawSalesTrend();
      drawPaymentChart();
      drawCategoryChart();
      initSparklines();
    }, 250);
  });

  // ============================================
  // Initialize All
  // ============================================
  function initDashboard() {
    initCounters();
    drawSalesTrend();
    drawPaymentChart();
    drawCategoryChart();
    renderTopProducts();
    renderRecentTransactions();
    renderLowStock();
    renderStoreCards();
    renderEmployeeRank();
    initSparklines();
    initFilters();
    initScrollAnimations();
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", initDashboard);
  } else {
    initDashboard();
  }

  window.initHelpyDashboard = initDashboard;
})();
