# Angular

**Sweet spot:** large organisations, many teams, decade-horizon
applications — where the framework's opinions ARE the governance.

## Pros
- Everything in the box (router, forms, HTTP, i18n, testing) with one
  upgrade path; `ng update` across majors is genuinely good.
- Signals + zoneless change detection have modernised performance.
- Strong typing culture end-to-end; consistency across large teams is
  the point.

## Cons
- Heaviest conceptual surface (modules→standalone migration, DI,
  RxJS where signals don't reach yet).
- Baseline bundle above Svelte/Solid class.
- Rare in startup/prototype contexts; AI-assistant fluency mid-tier.

## Overkill when
- Team < ~10 or product horizon < ~2 years — almost always, for
  EpicContext-style prototypes. It earns its weight at org scale, not
  project scale.

## Build & checks
```bash
ng build --configuration production   # budgets in angular.json FAIL the build (use them)
npx lhci autorun
```
Angular's `budgets` config is the best-integrated size enforcement of
any framework — set `maximumError` and the build enforces it natively.
