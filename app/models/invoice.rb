class Invoice < ActiveRecord::Base
  belongs_to :client
  validates_numericality_of :amount
  validates_presence_of :client_id, :invoice_number, :due_at, :sent_at, :subject, :remit_to


end
