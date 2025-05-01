from pydantic import BaseModel
from typing import Optional

class ProductBase(BaseModel):
    product_name: str
    category_id: Optional[int]
    supplier_id: Optional[int]
    unit_price: Optional[float]
    quantity_in_stock: Optional[int]

class ProductCreate(ProductBase):
    pass

class Product(ProductBase):
    product_id: int

    class Config:
        orm_mode = True
