// Dark mode toggle
document.addEventListener('DOMContentLoaded', () => {
  const toggle = document.getElementById('theme-toggle');
  const html = document.documentElement;
  const bg = document.querySelector('.animated-bg');
  
  const currentTheme = localStorage.getItem('theme') || 'dark';
  html.classList.toggle('dark', currentTheme === 'dark');
  
  toggle?.addEventListener('click', () => {
    const isDark = html.classList.toggle('dark');
    localStorage.setItem('theme', isDark ? 'dark' : 'light');
    
    // Animate background with ripple effect
    const ripple = document.createElement('div');
    ripple.className = 'theme-ripple';
    ripple.style.left = '50%';
    ripple.style.top = '50%';
    document.body.appendChild(ripple);
    
    setTimeout(() => ripple.remove(), 1000);
    
    // Pulse animation on background
    bg?.classList.add('theme-transition');
    setTimeout(() => bg?.classList.remove('theme-transition'), 1000);
  });

  // Counter animation
  const animateCounter = (element) => {
    const target = parseInt(element.dataset.target);
    const duration = 2000;
    const increment = target / (duration / 16);
    let current = 0;
    
    const updateCounter = () => {
      current += increment;
      if (current < target) {
        element.textContent = Math.floor(current) + (element.textContent.match(/\+/) ? '+' : '');
        requestAnimationFrame(updateCounter);
      } else {
        element.textContent = target + (element.textContent.match(/\+/) ? '+' : '');
      }
    };
    
    updateCounter();
  };

  // Generate random chart data (crypto-like) with seed for consistency
  const seededRandom = (seed) => {
    const x = Math.sin(seed++) * 10000;
    return x - Math.floor(x);
  };

  const generateChartData = (seed, points = 15) => {
    const data = [];
    let value = 30 + seededRandom(seed) * 40;
    
    for (let i = 0; i < points; i++) {
      value += (seededRandom(seed + i) - 0.5) * 20;
      value = Math.max(10, Math.min(90, value));
      data.push(value);
    }
    
    return data;
  };

  // Animate chart
  const animateChart = (svg) => {
    const seed = parseInt(svg.dataset.index);
    const milestones = JSON.parse(svg.dataset.milestones || '[]');
    const data = generateChartData(seed);
    const width = svg.clientWidth;
    const height = svg.clientHeight;
    const points = data.length;
    
    // Line points
    const linePoints = data.map((value, i) => {
      const x = (i / (points - 1)) * width;
      const y = height - (value / 100) * height;
      return `${x},${y}`;
    }).join(' ');
    
    // Area points (for fill)
    const areaPoints = `0,${height} ${linePoints} ${width},${height}`;
    
    const line = svg.querySelector('polyline:first-child');
    const area = svg.querySelector('polyline:last-child');
    
    // Add dots with milestone tooltip
    const existingDots = svg.querySelectorAll('circle');
    if (existingDots.length === 0) {
      data.forEach((value, i) => {
        const x = (i / (points - 1)) * width;
        const y = height - (value / 100) * height;
        
        // Create dot
        const circle = document.createElementNS('http://www.w3.org/2000/svg', 'circle');
        circle.setAttribute('cx', x);
        circle.setAttribute('cy', y);
        circle.setAttribute('r', '3');
        circle.setAttribute('class', 'fill-rose-500 dark:fill-rose-400 opacity-0 transition-all duration-300 cursor-pointer');
        circle.setAttribute('data-value', Math.floor(value));
        
        // Add hover effect with milestone
        circle.addEventListener('mouseenter', function() {
          this.setAttribute('r', '5');
          // Show tooltip with milestone
          const milestone = milestones[i] || `Progress ${i + 1}`;
          const tooltip = document.createElement('div');
          tooltip.className = 'chart-tooltip';
          tooltip.textContent = milestone;
          tooltip.style.position = 'absolute';
          
          // Calculate position to prevent overflow
          const parentRect = svg.parentElement.getBoundingClientRect();
          let leftPos = x;
          let topPos = y - 35;
          
          // Adjust if too far right
          if (leftPos > parentRect.width - 100) {
            leftPos = parentRect.width - 100;
          }
          
          // Adjust if too far left
          if (leftPos < 0) {
            leftPos = 10;
          }
          
          tooltip.style.left = leftPos + 'px';
          tooltip.style.top = topPos + 'px';
          svg.parentElement.appendChild(tooltip);
        });
        
        circle.addEventListener('mouseleave', function() {
          this.setAttribute('r', '3');
          const tooltip = svg.parentElement.querySelector('.chart-tooltip');
          if (tooltip) tooltip.remove();
        });
        
        svg.appendChild(circle);
      });
    }
    
    // Animate with delay
    setTimeout(() => {
      line.setAttribute('points', linePoints);
      area.setAttribute('points', areaPoints);
      
      // Show dots
      svg.querySelectorAll('circle').forEach((circle, i) => {
        setTimeout(() => {
          circle.style.opacity = '1';
        }, i * 50);
      });
    }, 100);
  };

  // Scroll animations
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('animate-in');
        
        // Animate counters when visible (only once)
        if (entry.target.classList.contains('counter') && !entry.target.dataset.animated) {
          animateCounter(entry.target);
          entry.target.dataset.animated = 'true';
        }
        
        // Animate charts when visible (only once)
        if (entry.target.classList.contains('stat-chart') && !entry.target.dataset.animated) {
          animateChart(entry.target);
          entry.target.dataset.animated = 'true';
        }
        
        // Animate progress bars
        if (entry.target.classList.contains('progress-bar') && !entry.target.dataset.animated) {
          const progress = entry.target.dataset.progress;
          setTimeout(() => {
            entry.target.style.width = progress + '%';
          }, 100);
          entry.target.dataset.animated = 'true';
        }
      }
    });
  }, { threshold: 0.1 });

  document.querySelectorAll('.fade-in').forEach(el => observer.observe(el));
  document.querySelectorAll('.counter').forEach(el => observer.observe(el));
  document.querySelectorAll('.stat-chart').forEach(el => observer.observe(el));
  document.querySelectorAll('.progress-bar').forEach(el => observer.observe(el));

  // Typing effect
  const typingElement = document.querySelector('.typing-effect');
  if (typingElement) {
    const text = typingElement.textContent;
    typingElement.textContent = '';
    let i = 0;
    const typeWriter = () => {
      if (i < text.length) {
        typingElement.textContent += text.charAt(i);
        i++;
        setTimeout(typeWriter, 50);
      }
    };
    typeWriter();
  }
});
