import { Component, OnInit } from '@angular/core';
import { SalesOrderService } from '../../../services/saleOrder.service';
import { SaleOrder , SaleItem } from '../../../entities/index';
import { NgForm } from '@angular/forms';
import { Response } from '@angular/http';

import { AppError, NotFoundError,BadInput } from '../../../utilites/errorHandling/index';

@Component({
  selector: 'app-sales-order',
  templateUrl: './sales-order.component.html',
  styleUrls: ['./sales-order.component.css']
})
export class SalesOrderComponent implements OnInit {
  
  _saleOrder: SaleOrder;
  _saleItem: SaleItem;
  
  constructor(private _salesOrderService: SalesOrderService) { 
    this._saleOrder = new SaleOrder();
    this._saleOrder.SaleItems=[];
    this._saleItem = new SaleItem();
  }

  ngOnInit() {
  }

  AddItem()
  {
    this._saleOrder.SaleItems.push(this._saleItem);
    this._saleItem = new SaleItem();
  }

  Add() {

    this._salesOrderService.Add(this._saleOrder)
      .subscribe(returnData => {
        console.log(returnData.SaleId);

        this._saleOrder = new SaleOrder();
        this._saleOrder.SaleItems=[];
        this._saleItem = new SaleItem();

      },
      (error: AppError ) => {
        if (error instanceof BadInput) {
          alert('BadInput');
        }
        else throw error;
      });
  }

  Delete(_cat: SaleItem) {
    let index = this._saleOrder.SaleItems.indexOf(_cat);
    this._saleOrder.SaleItems.splice(index, 1);
  }

}
