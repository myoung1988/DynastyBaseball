using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using GeneralAPI.Models;

namespace GeneralAPI.Controllers
{
    public class CRTController : ApiController
    {
        private GeneralEntities db = new GeneralEntities();

        // GET api/CRT
        public IQueryable<Cash_Receipt_Transaction> GetCash_Receipt_Transaction()
        {
            return db.Cash_Receipt_Transaction;
        }

        // GET api/CRT/5
        [ResponseType(typeof(Cash_Receipt_Transaction))]
        public IHttpActionResult GetCash_Receipt_Transaction(int id)
        {
            Cash_Receipt_Transaction cash_receipt_transaction = db.Cash_Receipt_Transaction.Find(id);
            if (cash_receipt_transaction == null)
            {
                return NotFound();
            }

            return Ok(cash_receipt_transaction);
        }

        // PUT api/CRT/5
        public IHttpActionResult PutCash_Receipt_Transaction(int id, Cash_Receipt_Transaction cash_receipt_transaction)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != cash_receipt_transaction.CashID)
            {
                return BadRequest();
            }

            db.Entry(cash_receipt_transaction).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!Cash_Receipt_TransactionExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST api/CRT
        [ResponseType(typeof(Cash_Receipt_Transaction))]
        public IHttpActionResult PostCash_Receipt_Transaction(Cash_Receipt_Transaction cash_receipt_transaction)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Cash_Receipt_Transaction.Add(cash_receipt_transaction);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (Cash_Receipt_TransactionExists(cash_receipt_transaction.CashID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = cash_receipt_transaction.CashID }, cash_receipt_transaction);
        }

        // DELETE api/CRT/5
        [ResponseType(typeof(Cash_Receipt_Transaction))]
        public IHttpActionResult DeleteCash_Receipt_Transaction(int id)
        {
            Cash_Receipt_Transaction cash_receipt_transaction = db.Cash_Receipt_Transaction.Find(id);
            if (cash_receipt_transaction == null)
            {
                return NotFound();
            }

            db.Cash_Receipt_Transaction.Remove(cash_receipt_transaction);
            db.SaveChanges();

            return Ok(cash_receipt_transaction);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool Cash_Receipt_TransactionExists(int id)
        {
            return db.Cash_Receipt_Transaction.Count(e => e.CashID == id) > 0;
        }
    }
}