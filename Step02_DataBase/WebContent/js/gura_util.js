
   /*
      ajaxPromise("요청url", "요청메소드", query string or object)
      와 같은 형식으로 사용하고 
      Promise type 을 리턴해주는 함수 
   */
   function ajaxPromise(url, method, data){
      //만일 필요한 값이 전달 되지 않으면 기본값을 method 와 data 에 넣어준다. 
      if(method == undefined || method == null){
         method="GET";
      }
      if(data == undefined || data == null){
         data={};
      }
      
      let queryString;
      if(typeof data == "string"){
         queryString=data;
      }else{
         queryString=toQueryString(data);
      }
      
      // Promise 객체를 담을 변수 만들기 
      let promise;
      if(method=="GET" || method=="get"){//만일 GET 방식 전송이면 
         //fetch() 함수를 호출하고 리턴되는 Promise 객체를 변수에 담는다. 
         promise=fetch(url+"?"+queryString);
      }else if(method=="POST" || method=="post"){//만일 POST 방식 전송이면
         //fetch() 함수를 호출하고 리턴되는 Promise 객체를 변수에 담는다. 
         promise=fetch(url,{
            method:"POST",
            headers:{"Content-Type":"application/x-www-form-urlencoded; charset=utf-8"},
            body:queryString
         });
      }
      return promise;
   }
   
   //함수의 인자로 ajax 전송할 폼의 참조값을 넣어주면 알아서 ajax 전송되도록 하는 함수 
   function ajaxFormPromise(form){
      const url=form.getAttribute("action");
      const method=form.getAttribute("method");
      const queryString=new URLSearchParams(new FormData(form)).toString();
      // Promise 객체를 담을 변수 만들기 
      let promise;
      if(method=="GET" || method=="get"){//만일 GET 방식 전송이면 
         //fetch() 함수를 호출하고 리턴되는 Promise 객체를 변수에 담는다. 
         promise=fetch(url+"?"+queryString);
      }else if(method=="POST" || method=="post"){//만일 POST 방식 전송이면
         //fetch() 함수를 호출하고 리턴되는 Promise 객체를 변수에 담는다. 
         promise=fetch(url,{
            method:"POST",
            headers:{"Content-Type":"application/x-www-form-urlencoded; charset=utf-8"},
            body:queryString
         });
      }
      return promise;
   }
   
   
   //인자로 전달하는 object 를 이용해서 query  문자열을 만들어서 리턴해주는 함수
   function toQueryString(obj){
      //빈배열을 일단 만든다.
      let arr=[];
      //반복문 돌면서 obj 에 있는 정보를 "key=value" 형태로 만들어서 배열에 저장한다.
      for(let key in obj){
         //value 는 인코딩도 해준다. 
         let tmp=key+"="+encodeURIComponent(obj[key]);
         arr.push(tmp);
      }
      //query 문자열을 얻어낸다
      let queryString=arr.join("&");
      //결과를 리턴해준다.
      return queryString;
   }
