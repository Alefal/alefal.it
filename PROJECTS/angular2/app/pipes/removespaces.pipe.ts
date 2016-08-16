import { Pipe, PipeTransform } from '@angular/core';
 
@Pipe({
    name: 'removeSpaces',
    pure: false
})
export class RemoveSpaces implements PipeTransform {
    transform(value){
		//return value.replace(/ /g, '');               //space
		return value.replace(/(\r\n|\n|\r)/gm, '');     //\n \r
        
	}
}