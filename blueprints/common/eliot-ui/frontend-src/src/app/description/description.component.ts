import { Component, OnInit } from '@angular/core';
import { ToolbarService } from './../toolbar/toolbar.service';

// import {} from './../../assets/md/README.md';

@Component({
  selector: 'app-description',
  templateUrl: './description.component.html',
  styleUrls: ['./description.component.scss']
})
export class DescriptionComponent implements OnInit {
  
  constructor(public toolbarService: ToolbarService) { }

  ngOnInit() {
    this.toolbarService.show();
  }

  errorHandler(event) {
    console.log("Inside errorHandler.....");
    console.log(event);
  }

  loadedHandler(event) {
    console.log("Inside loadedHandler");
    console.log(event);
  }

}
