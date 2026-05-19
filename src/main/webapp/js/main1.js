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

  // Add a copy-to-clipboard button to every <pre> that contains <code>.
  function wireCopyCode() {
    document.querySelectorAll('pre > code').forEach((code) => {
      const pre = code.parentElement;
      if (!pre || pre.querySelector(':scope > .copy-btn')) return;
      pre.classList.add('has-copy');
      const btn = document.createElement('button');
      btn.type = 'button';
      btn.className = 'copy-btn';
      btn.setAttribute('aria-label', 'Copy code');
      btn.innerHTML = '<span aria-hidden="true">📋</span><span>Copy</span>';
      btn.addEventListener('click', async () => {
        const text = code.innerText;
        try {
          if (navigator.clipboard && window.isSecureContext) {
            await navigator.clipboard.writeText(text);
          } else {
            const ta = document.createElement('textarea');
            ta.value = text;
            ta.style.position = 'fixed';
            ta.style.left = '-9999px';
            document.body.appendChild(ta);
            ta.select();
            document.execCommand('copy');
            document.body.removeChild(ta);
          }
          btn.classList.add('is-copied');
          btn.innerHTML = '<span aria-hidden="true">✓</span><span>Copied</span>';
          setTimeout(() => {
            btn.classList.remove('is-copied');
            btn.innerHTML = '<span aria-hidden="true">📋</span><span>Copy</span>';
          }, 1500);
        } catch (e) {
          console.error('Copy failed', e);
        }
      });
      pre.appendChild(btn);
    });
  }

  document.addEventListener('DOMContentLoaded', async () => {
    await injectPartials();
    wireHeader();
    wireCourse();
    wireLiteYouTube();
    wireCopyCode();
  });
})();
