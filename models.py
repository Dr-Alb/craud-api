from sqlalchemy import Column, Integer, String, ForeignKey, DECIMAL, DateTime, func
from sqlalchemy.orm import relationship
from .database import Base

class Category(Base):
    __tablename__ = "categories"
    category_id = Column(Integer, primary_key=True, index=True)
    category_name = Column(String(100), unique=True, nullable=False)

class Supplier(Base):
    __tablename__ = "suppliers"
    supplier_id = Column(Integer, primary_key=True, index=True)
    supplier_name = Column(String(100), nullable=False)
    contact_email = Column(String(100), unique=True)
    phone = Column(String(20))

class Product(Base):
    __tablename__ = "products"
    product_id = Column(Integer, primary_key=True, index=True)
    product_name = Column(String(100), nullable=False)
    category_id = Column(Integer, ForeignKey("categories.category_id"))
    supplier_id = Column(Integer, ForeignKey("suppliers.supplier_id"))
    unit_price = Column(DECIMAL(10, 2))
    quantity_in_stock = Column(Integer, default=0)

class StockEntry(Base):
    __tablename__ = "stock_entries"
    entry_id = Column(Integer, primary_key=True, index=True)
    product_id = Column(Integer, ForeignKey("products.product_id"))
    quantity_change = Column(Integer)
    entry_date = Column(DateTime, default=func.now())
    description = Column(String(255))
