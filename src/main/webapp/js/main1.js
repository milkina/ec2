// Tiny include system + UI behavior for the static ExamClouds prototype.
(function () {
  async function injectPartials() {
    const slots = document.querySelectorAll('[data-include]');
    await Promise.all(
      Array.from(slots).map(async (el) => {
        const url = el.getAttribute('data-include');
        try {
          const res = await fetch(url);
          el.innerHTML = await res.text();
        } catch (e) {
          console.error('Failed to load partial', url, e);
        }
      })
    );
  }

  function wireHeader() {
    // Mobile menu
    const btn = document.querySelector('[data-mobile-toggle]');
    const nav = document.querySelector('[data-mobile-nav]');
    if (btn && nav) {
      const header = btn.closest('.site-header');
      btn.addEventListener('click', () => {
        const open = nav.classList.toggle('open');
        if (header) header.classList.toggle('is-open', open);
        btn.setAttribute('aria-expanded', String(open));
      });
    }

    // Courses mega menu — hover on desktop, click on touch/mobile
    const cBtn = document.querySelector('[data-courses-toggle]');
    const cPanel = document.querySelector('[data-courses-panel]');
    const cWrap = cBtn && cBtn.closest('.nav-courses');
    if (cBtn && cPanel && cWrap) {
      const toggleMega = (force) => {
        const open = force !== undefined ? force : cPanel.hasAttribute('hidden');
        if (open) cPanel.removeAttribute('hidden'); else cPanel.setAttribute('hidden', '');
        cBtn.setAttribute('aria-expanded', String(open));
      };
      const isHoverCapable = window.matchMedia('(hover: hover) and (pointer: fine)').matches;
      let closeTimer;
      const cancelClose = () => { if (closeTimer) { clearTimeout(closeTimer); closeTimer = null; } };
      const scheduleClose = () => { cancelClose(); closeTimer = setTimeout(() => toggleMega(false), 120); };

      if (isHoverCapable) {
        cWrap.addEventListener('mouseenter', () => { cancelClose(); toggleMega(true); });
        cWrap.addEventListener('mouseleave', scheduleClose);
        cPanel.addEventListener('mouseenter', cancelClose);
        cPanel.addEventListener('mouseleave', scheduleClose);
        cBtn.addEventListener('focus', () => toggleMega(true));
        cWrap.addEventListener('focusout', (e) => {
          if (!cWrap.contains(e.relatedTarget) && !cPanel.contains(e.relatedTarget)) toggleMega(false);
        });
      }
      cBtn.addEventListener('click', (e) => { e.preventDefault(); toggleMega(); });
      document.addEventListener('click', (e) => {
        if (!cBtn.contains(e.target) && !cPanel.contains(e.target)) toggleMega(false);
      });
      document.addEventListener('keydown', (e) => { if (e.key === 'Escape') toggleMega(false); });
    }

    // Language switch
    document.querySelectorAll('.lang-switch button').forEach((b) => {
      b.addEventListener('click', () => {
        document.querySelectorAll('.lang-switch button').forEach((x) => x.classList.remove('is-active'));
        b.classList.add('is-active');
        document.documentElement.lang = b.dataset.lang;
      });
    });

    // User menu (logged-in)
    const uBtn = document.querySelector('[data-user-toggle]');
    const uPanel = document.querySelector('[data-user-panel]');
    if (uBtn && uPanel) {
      const toggleUser = (force) => {
        const open = force !== undefined ? force : uPanel.hasAttribute('hidden');
        if (open) uPanel.removeAttribute('hidden'); else uPanel.setAttribute('hidden', '');
        uBtn.setAttribute('aria-expanded', String(open));
      };
      uBtn.addEventListener('click', () => toggleUser());
      document.addEventListener('click', (e) => {
        if (!uBtn.contains(e.target) && !uPanel.contains(e.target)) toggleUser(false);
      });
      const so = document.querySelector('[data-signout]');
      if (so) so.addEventListener('click', () => {
        // TODO: real signOut() — for now just toggle demo auth state
        document.body.classList.remove('is-auth');
        toggleUser(false);
      });
    }

    // Demo: ?auth=1 to preview logged-in state
    if (new URLSearchParams(location.search).get('auth') === '1') {
      document.body.classList.add('is-auth');
    }
  }

  // Roadmap renderer (mirrors RoadmapPath.tsx)
  const roadmap = [
    { num: 1,  title: 'Java Introduction',         topic: 'Foundations' },
    { num: 2,  title: 'Run Your First Java App',   topic: 'Foundations' },
    { num: 3,  title: 'Java Syntax',               topic: 'Foundations' },
    { num: 4,  title: 'Java Operations',           topic: 'Foundations' },
    { num: 5,  title: 'Operators',                 topic: 'Foundations' },
    { num: 6,  title: 'Arrays',                    topic: 'Data' },
    { num: 7,  title: 'Sorting Algorithms',        topic: 'Data' },
    { num: 8,  title: 'Git & GitHub',              topic: 'Tooling' },
    { num: 9,  title: 'OOP Basics',                topic: 'OOP' },
    { num: 10, title: 'Overloading vs Overriding', topic: 'OOP' },
  ];
  const COMPLETED_THROUGH = 2;
  const ICON_CHECK = '<svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>';
  const ICON_PLAY = '<svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor" stroke="none"><polygon points="6 3 20 12 6 21 6 3"/></svg>';
  const ICON_LOCK = '<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>';

  function renderRoadmap() {
    const host = document.querySelector('[data-roadmap]');
    if (!host) return;
    const html = roadmap.map((s, i) => {
      const done = s.num <= COMPLETED_THROUGH;
      const current = s.num === COMPLETED_THROUGH + 1;
      const cls = ['roadmap-item', i % 2 === 0 ? 'even' : 'odd'];
      if (done) cls.push('is-done');
      if (current) cls.push('is-current');
      const numHtml = done ? ICON_CHECK : s.num;
      const aside = current
        ? `<span class="step-aside">${ICON_PLAY} Start</span>`
        : done
          ? `<span class="step-aside">Done</span>`
          : `<span class="step-aside locked">${ICON_LOCK}</span>`;
      return `
        <li class="${cls.join(' ')}">
          <a href="#lesson">
            <span class="step-num">${numHtml}</span>
            <div class="step-text">
              <p class="step-topic">${s.topic}</p>
              <p class="step-title">${s.title}</p>
            </div>
            ${aside}
          </a>
        </li>`;
    }).join('');
    host.innerHTML = html;
  }

  // Course page interactions: collapse/expand modules & lessons
  function wireCourse() {
    document.querySelectorAll('[data-toggle-target]').forEach((btn) => {
      btn.addEventListener('click', () => {
        const id = btn.getAttribute('data-toggle-target');
        const tgt = document.getElementById(id);
        if (!tgt) return;
        const open = tgt.hasAttribute('hidden');
        if (open) tgt.removeAttribute('hidden'); else tgt.setAttribute('hidden', '');
        btn.setAttribute('aria-expanded', String(open));
      });
    });
  }

  // Lazy YouTube embed: replace poster with iframe on click
  function wireLiteYouTube() {
    document.querySelectorAll('.lite-yt').forEach((btn) => {
      btn.addEventListener('click', () => {
        const id = btn.getAttribute('data-yt-id');
        if (!id) return;
        const iframe = document.createElement('iframe');
        iframe.src = `https://www.youtube-nocookie.com/embed/${id}?autoplay=1&rel=0`;
        iframe.title = btn.getAttribute('aria-label') || 'YouTube video';
        iframe.allow = 'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture';
        iframe.allowFullscreen = true;
        iframe.style.width = '100%';
        iframe.style.aspectRatio = '16/9';
        iframe.style.border = '0';
        iframe.style.borderRadius = '1.25rem';
        btn.replaceWith(iframe);
      }, { once: true });
    });
  }

  document.addEventListener('DOMContentLoaded', async () => {
    await injectPartials();
    wireHeader();
    renderRoadmap();
    wireCourse();
    wireLiteYouTube();
  });
})();
