# Task Overview

EcoOrder, a growing e-commerce platform, must record every status change for orders (e.g., when an order is placed, shipped, delivered, or cancelled) to meet regulatory audit trail requirements. The status changes must be recorded in a separate audit table in PostgreSQL, asynchronously from the main status update API, so that end-users experience no lag. The core FastAPI app and routes are ready, but the audit schema, relationship design, and async background DB recording logic are not implemented.

## Guidance

- The file `app/main.py` contains the status update route and demonstrates where background logic should integrate.
- Database connection and session management are set up in `app/database.py`.
- The database schema creation is handled via `schema.sql`.
- Use the `run.sh` script to start Dockerized FastAPI and PostgreSQL services and initialize the DB schema.

## Objectives

- Design a normalized PostgreSQL table for order status change audit entries, including timestamps, status, reason, and foreign-key relation to the orders table.
- Implement async background logic in FastAPI that records each status change event into the audit log table after the main API updates an order's status.
- Ensure referential integrity between orders and audit logs, and safeguard against missed or duplicate audit records.
- All interactions must use modern async SQLAlchemy patterns.

## How to Verify

- Submit order status changes via the `/orders/{order_id}/status` endpoint and confirm the response is immediate.
- Query the `/orders/{order_id}/audit-log` endpoint to verify the order's full status change history appears, including timestamp and reason, in the correct order.
- Confirm the audit entry persists in the database by inspecting the `order_audit_logs` table via psql or a GUI (e.g., pgAdmin).
- Simulate multiple quick status changes—each must result in a separate audit entry.
