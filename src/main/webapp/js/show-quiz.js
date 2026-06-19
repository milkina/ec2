const QUESTIONS = [
      {
        topic: "Java Core",
        items: [
          { q: "What is the difference between JDK, JRE, and JVM?", a: "JDK is the development kit including compiler and tools. JRE is the runtime providing libraries and JVM. JVM is the virtual machine that executes bytecode." },
          { q: "Explain == vs equals().", a: "== compares references for objects (and values for primitives). equals() compares logical equality and is overridden in classes like String." },
          { q: "What is autoboxing?", a: "Automatic conversion between primitives (int) and their wrapper classes (Integer) by the compiler." }
        ]
      },
      {
        topic: "OOP",
        items: [
          { q: "What are the four pillars of OOP?", a: "Encapsulation, Inheritance, Polymorphism, Abstraction." },
          { q: "Difference between abstract class and interface?", a: "Abstract classes can hold state and partial implementation; interfaces declare a contract and (since Java 8) default methods. A class can implement many interfaces but extend only one class." }
        ]
      },
      {
        topic: "Collections",
        items: [
          { q: "ArrayList vs LinkedList?", a: "ArrayList is backed by a resizable array — fast random access, slower middle insert. LinkedList is doubly linked — faster inserts/removes, slower indexing." },
          { q: "How does HashMap work?", a: "Buckets indexed by hash(key). Collisions resolved with linked lists, converting to balanced trees after a threshold (Java 8+)." }
        ]
      },
      {
        topic: "Concurrency",
        items: [
          { q: "Difference between synchronized and ReentrantLock?", a: "synchronized is a simpler intrinsic lock managed by JVM. ReentrantLock offers tryLock, fairness policy, multiple condition variables, and interruptibility." },
          { q: "What is volatile?", a: "Guarantees visibility of writes across threads and prevents instruction reordering for that variable, but does not provide atomicity." }
        ]
      }
    ];

    const STORAGE_KEY = "examclouds:interview-done";
    const CHECK_SVG = '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg>';

    function hashId(s) {
      let h = 0;
      for (let i = 0; i < s.length; i++) h = (h * 31 + s.charCodeAt(i)) | 0;
      return "q_" + (h >>> 0).toString(36);
    }

    function loadDone() {
      try { return JSON.parse(localStorage.getItem(STORAGE_KEY) || "{}"); }
      catch { return {}; }
    }
    function saveDone(d) {
      try { localStorage.setItem(STORAGE_KEY, JSON.stringify(d)); } catch {}
    }

    let done = loadDone();
    let query = "";
    const groupsEl = document.getElementById("iq-groups");
    const doneEl = document.getElementById("iq-done");
    const totalEl = document.getElementById("iq-total");
    const searchEl = document.getElementById("iq-search");

    function escapeHtml(s) {
      return s.replace(/[&<>"']/g, c => ({"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#39;"}[c]));
    }

    function render() {
      const q = query.trim().toLowerCase();
      const groups = QUESTIONS
        .map(g => ({ ...g, items: q ? g.items.filter(i => i.q.toLowerCase().includes(q) || i.a.toLowerCase().includes(q)) : g.items }))
        .filter(g => g.items.length);

      const allIds = QUESTIONS.flatMap(g => g.items.map(it => hashId(it.q)));
      totalEl.textContent = allIds.length;
      doneEl.textContent = allIds.filter(id => done[id]).length;

      if (!groups.length) {
        groupsEl.innerHTML = '<p class="iq-empty">No matches for "' + escapeHtml(query) + '".</p>';
        return;
      }

      groupsEl.innerHTML = groups.map(g => `
        <section class="iq-group">
          <h2>${escapeHtml(g.topic)}</h2>
          <div class="iq-list">
            ${g.items.map(it => {
              const id = hashId(it.q);
              const isDone = !!done[id];
              return `
                <details class="iq-item ${isDone ? "is-done" : ""}" data-id="${id}">
                  <summary class="iq-summary">
                    <button type="button" class="iq-check" aria-pressed="${isDone}" aria-label="${isDone ? "Mark as not done" : "Mark as done"}" data-toggle="${id}">
                      ${CHECK_SVG}
                    </button>
                    <div class="iq-q">${escapeHtml(it.q)}</div>
                    <span class="iq-plus" aria-hidden="true">+</span>
                  </summary>
                  <p class="iq-a">${escapeHtml(it.a)}</p>
                </details>
              `;
            }).join("")}
          </div>
        </section>
      `).join("");
    }

    groupsEl.addEventListener("click", (e) => {
      const btn = e.target.closest("[data-toggle]");
      if (!btn) return;
      e.preventDefault();
      e.stopPropagation();
      const id = btn.getAttribute("data-toggle");
      if (done[id]) delete done[id]; else done[id] = true;
      saveDone(done);
      render();
    });

    searchEl.addEventListener("input", (e) => { query = e.target.value; render(); });

    render();