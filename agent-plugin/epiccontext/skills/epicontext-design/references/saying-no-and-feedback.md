# Saying no, and feedback — P8 and P10 in practice

## Saying no

Requests arrive from every side, and most are made in good faith. The job
is to protect the experience without becoming the obstacle:

- Answer the request with the principle it touches and the severity of
  ignoring it. "P3, major: hiding the filter on desktop halves its use
  (NN/g 2016)" lands; "I don't think it's right" doesn't.
- If the request's reason is one of the three non-arguments (worked
  before, looks nice, less work), say which, and ask what experience it
  improves. If there is an answer, it may be a real finding on our side.
- If the request comes with evidence — a test, data, a recorded project
  rule — the evidence wins, and the principle's reverse clause is the way
  to say yes without breaking the system.

## Feedback and evaluation — P10 in practice

When comments or feedback arrive — from a stakeholder, a user test, a
`feedback` entity, or `ingest_comments` — do not apply them; **classify**
them first. `epicontext-analysis` holds the taxonomy: a real problem, an
acceptable trade-off, drift, a wrong-persona signal, or vanity. Ask what
the person was trying to do, where they were in the journey, and what the
comment does not say. Then propose, with the principle it touches, whether
the design changes, the project rule changes, or nothing changes and why.
Land the classification as a `feedback` entity with its trace, so the next
session doesn't reopen it.
