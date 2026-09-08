#!/usr/bin/env python3
"""
generate_kb.py

Generates a synthetic employee-handbook knowledge base for "Nexora Cloud
Solutions" (fictional B2B SaaS company) as a set of Markdown files, matching
the structure used in production-rag/data/.

Usage:
    python generate_kb.py [--out-dir ./data] [--company "Your Fake Co"]

Design notes:
- Each doc follows a consistent shape: scope -> core rule -> process ->
  exception clause -> cross-reference. This mirrors real handbooks and
  gives your chunker/retriever predictable structure to work with.
- Numbers (days, thresholds, dollar amounts) are kept consistent across
  files on purpose, since a real handbook wouldn't self-contradict.
- Cross-references between docs are intentional -- useful for testing
  multi-hop / cross-document retrieval.
- Add new entries to the DOCS dict to extend the knowledge base.
"""

import argparse
import os
from pathlib import Path

COMPANY_DEFAULT = "Nexora Cloud Solutions"

DOCS = {
    "leave_policy.md": """# Annual Leave Policy

Employees who have completed one year of service receive
15 days of annual leave per calendar year.
Employees with less than one year of service accrue leave
on a monthly basis.
Annual leave should normally be requested at least three
business days before the intended date.
Managers may reject a leave request when business
circumstances make the requested period impractical.
Unused annual leave follows {company}'s annual leave
expiration policy: up to 5 unused days may be carried into
the next calendar year, and any remaining balance expires
on January 31.

# Sick Leave Policy

Employees receive 10 days of paid sick leave per calendar
year, available from the first day of employment.
Sick leave taken for more than three consecutive days
requires a medical certificate submitted to HR.
Unused sick leave does not carry over and does not convert
to annual leave.
Employees should notify their manager as early as possible
on the day of absence.

# Parental Leave Policy

Employees who have completed six months of service are
eligible for parental leave in line with local statutory
requirements.
{company} provides two weeks of fully paid parental leave
in addition to statutory entitlements.
Parental leave must be requested at least 30 days in
advance where the leave is planned.
Employees returning from parental leave are guaranteed
reinstatement to the same or an equivalent role.
""",

    "remote_work.md": """# Remote Work Policy

Employees may work remotely up to three days per week,
subject to manager approval and role suitability.
Fully remote arrangements require director-level sign-off
and are reviewed every six months.
Employees working remotely must be reachable during core
hours (10:00-16:00 local time).
Equipment for remote work is provided by the company and
must be returned upon request or at offboarding, per the
Equipment and Asset Policy.
Remote work does not change an employee's tax residency
obligations, which remain the employee's responsibility.

# Working Hours Policy

Standard working hours are 40 hours per week, with core
collaboration hours of 10:00-16:00 local time.
Employees may arrange flexible start and end times with
manager approval, provided core hours are maintained.
Overtime must be pre-approved by a manager and is
compensated in line with local labor law.
""",

    "expense_policy.md": """# Expense Reimbursement Policy

Business expenses must be submitted within 30 days of the
expense date via the finance portal.
Expenses under $100 require manager approval; expenses of
$100 or more require both manager and finance approval.
Original receipts or digital copies must be attached to
each claim.
Reimbursements are processed within one payroll cycle
following approval, consistent with the Payroll Policy.
Personal expenses submitted in error will be deducted from
the next payroll cycle.

# Travel Policy

Business travel must be booked through the approved
corporate travel portal wherever available.
Airfare is booked in economy class for flights under 6
hours and premium economy for longer flights, subject to
manager approval.
A daily per diem of $60 applies for meals not covered by
a hosted event, in line with the Expense Reimbursement
Policy's $100 pre-approval threshold.
""",

    "security_policy.md": """# Data Security and Confidentiality Policy

Employees must use company-issued devices for accessing
production systems and customer data.
Two-factor authentication is mandatory for all internal
and customer-facing systems.
Confidential company and customer information must not be
shared outside {company} without written authorization.
Suspected security incidents must be reported to the IT
Security team within 24 hours of discovery.
Violations of this policy may result in disciplinary
action up to and including termination, per the Code of
Conduct.

# Acceptable Use Policy

Company devices and accounts are provided for business use;
incidental personal use is permitted within reasonable
limits.
Installation of unauthorized software on company devices
is prohibited without IT approval.
Employees must not disable or circumvent security controls
such as endpoint protection or disk encryption.
""",

    "benefits.md": """# Health Insurance Benefits

{company} provides health insurance coverage for all
full-time employees, effective from the first day of the
following month after start date.
Dependents may be added to the plan during the annual open
enrollment period or within 30 days of a qualifying life
event.
Premiums are shared between {company} and the employee,
with the split communicated during onboarding.

# Retirement Plan

Employees are eligible to enroll in the company retirement
plan after 90 days of service.
{company} matches employee contributions up to 4% of base
salary.
Enrollment and contribution changes may be made at any time
through the benefits portal.

# Payroll Policy

Salaries are paid monthly, on the last business day of each
month, by direct deposit.
Payroll discrepancies should be reported to HR within 5
business days of the pay date.
Reimbursements approved under the Expense Reimbursement
Policy are included in the next scheduled payroll run.
""",
}

# Optional extra docs -- not in your current tree, but easy to include
# for a fuller knowledge base later.
EXTRA_DOCS = {
    "code_of_conduct.md": """# Code of Conduct

All employees are expected to act with honesty, integrity,
and respect toward colleagues, customers, and partners.
Harassment, discrimination, or retaliation of any kind will
not be tolerated and should be reported to HR immediately.
Conflicts of interest, including outside employment or
financial interests that could affect job duties, must be
disclosed to a manager or HR.
Violations of this policy are handled under {company}'s
disciplinary procedure and may result in termination.
""",

    "performance_reviews.md": """# Performance Review Policy

{company} conducts formal performance reviews twice per
year, in June and December.
Managers and employees jointly set goals at the start of
each review cycle using the company OKR framework.
Employees rated below expectations may be placed on a
Performance Improvement Plan (PIP) with defined milestones
over a 60-day period.
Promotion decisions are informed by, but not limited to,
performance review outcomes.
""",

    "offboarding.md": """# Offboarding Policy

Employees resigning voluntarily are asked to provide at
least four weeks' written notice.
All company equipment must be returned on or before the
last working day, per the Equipment and Asset Policy.
Access to company systems is revoked at end of business on
the employee's last working day.
Final pay, including any approved outstanding expense
reimbursements, is issued on the next scheduled payroll
date following departure.
""",
}


def build_docs(company: str, include_extra: bool) -> dict:
    merged = dict(DOCS)
    if include_extra:
        merged.update(EXTRA_DOCS)
    return {
        fname: content.format(company=company)
        for fname, content in merged.items()
    }


def main():
    parser = argparse.ArgumentParser(description="Generate a synthetic B2B employee handbook KB")
    parser.add_argument("--out-dir", default="./data", help="Output directory (default: ./data)")
    parser.add_argument("--company", default=COMPANY_DEFAULT, help="Fictional company name")
    parser.add_argument("--extra", action="store_true", help="Also generate extra docs (code_of_conduct, performance_reviews, offboarding)")
    parser.add_argument("--force", action="store_true", help="Overwrite existing files without prompting")
    args = parser.parse_args()

    out_dir = Path(args.out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)

    docs = build_docs(args.company, args.extra)

    written = []
    for fname, content in docs.items():
        fpath = out_dir / fname
        if fpath.exists() and not args.force:
            resp = input(f"{fpath} exists. Overwrite? [y/N] ").strip().lower()
            if resp != "y":
                print(f"Skipped {fpath}")
                continue
        fpath.write_text(content, encoding="utf-8")
        written.append(fpath)

    print(f"\nWrote {len(written)} file(s) to {out_dir.resolve()}:")
    for f in written:
        print(f"  - {f.name}")


if __name__ == "__main__":
    main()