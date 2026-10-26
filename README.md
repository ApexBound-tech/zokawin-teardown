# zokawin.com — a 29-day-old casino wearing someone else's licence

Investigation of `zokawin.com`, a crypto casino promoted via a fake MrBeast
tweet. Captured 2026-10-25. All evidence hashed; hash anchored in Bitcoin
and RFC 3161 timestamped.

## TL;DR

zokawin.com is a disposable front-end that borrows a real Curaçao operator's
identity, while its own support desk names a *different*, dissolved company.
It matches a scam template an industry watchdog has already ruled on.

## 1. The domain is 29 days old

| Domain | Created |
|---|---|
| kutawin.com | 2026-09-23 |
| lenuwin.com | 2026-09-25 |
| **zokawin.com** | **2026-09-26** |
| pozawin.com | 2026-06-10 |

Batch-registered inside a 72-hour window. Registrar (4 of 5): Atak Domain
Bilgi Teknolojileri A.S. All registered for exactly one year — minimum term.

The site presents itself as a licensed, established operator. At the time of
contact the domain was four weeks old.

## 2. A platform fingerprint anyone can check

The site sits behind a custom bot-shield that returns a non-standard HTTP
**666** with a `cast-mode` header, `cs-uuid` / `cs-resp` cookies and a
`/verifyjs` endpoint. It is **not** standard Cloudflare (no `cf_clearance`).

Because it is server-side, one `curl` finds it — no JavaScript needed. Check
any domain:

    curl -sI -m 10 https://DOMAIN/ | grep -i '^cast-mode:'
    curl -s -m 10 -o /dev/null -w "%{http_code}\n" https://DOMAIN/verifyjs

A hit on both = this platform.

**Five domains carry this fingerprint. All five have published scam write-ups:**

| Domain | Status |
|---|---|
| zokawin.com | newest |
| pozawin.com | documented scam |
| lenuwin.com | documented scam |
| kutawin.com | documented scam |
| pohawin.com | documented scam |

Independent write-up on kutawin: *"an identical Scam site to Ledgewin.com,
Ketsowin.com and Runicwin.com that differ only by name and domain."*

## 3. The site and its own support contradict each other

- **The /licenses page** states zokawin is owned and operated by
  **TechSolutions Group N.V.**, reg **144920**, Abraham Mendez Chumaceiro
  Boulevard 50, Willemstad. Payment agent TechSolutions (CY) Group Limited,
  Nicosia, HE 377018.
- **The support agent** ("Alice") stated, three times, that the licence is held
  by **InterStorm N.V.**, reg **137453**.

These are different companies.

InterStorm (Curaçao) N.V. was **dissolved 10 Nov 2025** and its CGA licence
**OGL/2024/106/0170 revoked 8 Dec 2025** — confirmed in the Curaçao Gaming
Authority's own licence register and the Curaçao Gazette. zokawin's support
presented it as current.

Asked three times for a **licence number**, Alice never gave one — only the
Chamber of Commerce registration number. She then deferred: *"I am not able to
provide information outside of what is officially stated on our website"* —
i.e. to the page that names a different company.

## 4. The certificate has the domain deleted

The "Certificate of Cooperation" is a bitmap. Its text reads:

> "This is to certify that **____** is operated by TechSolutions Group N.V. ..."

The CGA's own certificate for that same licence reads:

> "This is to certify that **20bet.com** is operated by TechSolutions Group N.V."

Everything else matches — company, registration number, licence number,
grant date, "Active" status. **Only the field identifying the domain is
missing.** The real document names a different site.

## 5. Independent corroboration

LCB.org investigated an identical template — `betpoint.cc` (Feb 2026) — with
word-for-word the same footer, same registration number, same Cyprus payment
agent:

> "The website betpoint.cc **falsely presents itself** as being owned and
> operated by TechSolutions Group N.V. ... There is **no affiliation,
> partnership, or connection**."
> "Casino does **NOT** hold a valid Curaçao Gaming Authority license."
> "It is **practically the same scam pattern**, just on a different, new domain."

LCB also documented fake games (manipulated JS, no provider servers) across
Pragmatic Play, Hacksaw, BGaming, Evoplay, 1Win, Mirror Image Gaming.

Same template also seen at: `fuxowin.com`, `bc-game.cam`, `blunkrij.com`,
`thugamb.cc`.

## 6. Other findings

- Balance grew **$2,500 → $5,600** with no play.
- Claimed "Tom Aspinall signs $20M deal" — **zero** external coverage.
- Eight compliance badges, but only **one** is a licence. The UKGC claim is
  worded "adheres to the regulations set by" — not "licensed by".
- Support: *"no further deposit requirements **for this specific
  verification**"* — leaving the door open.
- The "Certificate of Cooperation" is a picture, so it cannot be verified.

## The scam mechanism

1. Fake MrBeast promotion → you register
2. A large balance appears (here: $2,500, then $5,600)
3. Withdrawal is blocked: "Account verification error"
4. You must deposit to "verify" (here: $100)
5. Funds are never released; further deposits are requested
6. Domain shuts, reappears under a new name

**MrBeast has never launched a casino.** He posted one tweet
(2026-10-09) about a *Discord* giveaway scam — he never mentions a casino.

## Check it yourself

    ./fingerprint/fingerprint.sh DOMAIN
    ./fingerprint/tldscan.sh base1 base2 base3

## Evidence

All files in `evidence/` are hashed in `SHA256SUMS.txt`, anchored in Bitcoin
via OpenTimestamps (`SHA256SUMS.txt.ots`) and RFC 3161 timestamped by FreeTSA.

Full offline copies of both pages are included as standalone HTML.

## Sources

- Curaçao Gaming Authority licence register
- Curaçao Gazette (InterStorm dissolution)
- LCB.org: betpoint.cc investigation
- cryptozooworld.com: MrBeast casino scam
- howtoremove.guide: pozawin, lenuwin, kutawin, pohawin
- https://x.com/MrBeast/status/2108696909418578012
