<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!--====== App Content ======-->
    <div class="app-content" id="detailApp">

        <!--====== Section 1 ======-->
        <div class="u-s-p-t-90">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5">
                        <!--====== Product Breadcrumb ======-->
                        <div class="pd-breadcrumb u-s-m-b-30">
                            <ul class="pd-breadcrumb__list">
                                <li class="has-separator">

                                    <a href="../main/main.do">Home</a></li>
                                <li class="has-separator">
                                    <a href="../item/list.do">상품 목록</a></li>
                                <li class="has-separator">
                                    <a href="../item/detail.do?ino=${param.ino}">상품 상세</a></li>
                            </ul>
                        </div>
               	<!--====== Product Detail Zoom ======-->                        
					<div style="width: 100%; text-align: center;">
					    <img src="https://www.ocamall.com${vo.poster} " alt="상품 이미지" style="max-height: 370px; max-width: 100%;">
					</div>
                   </div>              
               <!--====== Product Right Side Details ======-->
                    <div class="col-lg-7">
                        <div class="pd-detail">
                            <div>
                                <span class="pd-detail__name"><h2>${vo.name}</h2></span>
                            </div>
                            <div class="u-s-m-b-15">
                            	<table class="table" style="font-size: 16px">
                            		<tr>
                            			<td class="text-center" width="20%"><b>종류</b></td>
                            			<td class="text-left" width="80%">
                            				<c:if test="${vo.type!=''}">
	                            				${vo.type}
                            				</c:if>
                            				<c:if test="${vo.type==''}">
	                            				&nbsp;-&nbsp;
                            				</c:if>
                            			</td>
                            		</tr>
                            		<tr>
                            			<td class="text-center" width="20%"><b>브랜드</b></td>
                            			<td class="text-left" width="80%">
                            				<c:if test="${vo.brand!=''}">
	                            				${vo.brand}
                            				</c:if>
                            				<c:if test="${vo.brand==''}">
	                            				&nbsp;-&nbsp;
                            				</c:if>
                            			</td>
                            		</tr>
                            		<tr>
                            			<td class="text-center" width="20%"><b>원가</b></td>
                            			<td class="text-left" width="80%">
                            				<c:if test="${vo.price!=null}">
	                            				${vo.price}원
                            				</c:if>
                            				<c:if test="${vo.price==null}">
	                            				Sold Out
                            				</c:if>
                            			</td>
                            		</tr>                           
										<tr>
                            			<td class="text-center" width="20%"><b>할인율</b></td>
                            			<td class="text-left" width="80%">
                            				<c:if test="${vo.discount!=''}">
        										<span style="color:red">${vo.discount}%</span>
                            				</c:if>
                            				<c:if test="${vo.discount==''}">
	                            				<span>&nbsp;-&nbsp;</span>
                            				</c:if>
                            			</td>
                            		</tr>
									<tr>
									  <td class="text-center" width="20%"><b>판매가</b></td>
									  <td class="text-left" width="80%">
									    <c:if test="${vo.price != null}">
									      <c:choose>
									        <c:when test="${vo.discount != ''}">
									          <fmt:parseNumber var="price" value="${vo.price}" integerOnly="true"/>
									          <fmt:parseNumber var="discount" value="${vo.discount}" integerOnly="true"/>
									          <c:set var="salePrice" value="${price - (price * discount / 100)}"/>
											 <fmt:formatNumber value="${salePrice}" type="number" maxFractionDigits="0" var="formattedSalePrice"/>
											<span id="salePrice">${formattedSalePrice}</span>원	
								          <input type="hidden" id="priceValue" value="${formattedSalePrice}" />
									        </c:when>
									        <c:otherwise>
									          ${vo.price}원
									          <input type="hidden" id="priceValue" value="${vo.price}" />
									        </c:otherwise>
									      </c:choose>
									    </c:if>
									    <c:if test="${vo.price == null}">
									      Sold Out
									    </c:if>
									  </td>
									</tr> 
									<tr>
									  <th class="text-center" width="25%">수량</th>
									  <td width="45%">
    									<select class="form-control" name="account" id="quantitySelect">
									      <c:forEach var="i" begin="1" end="10">
									        <option value="${i}" ${i == account ? 'selected' : ''}>${i}개</option>
									      </c:forEach>
									    </select>
									  </td>
									</tr>
									<tr>
									  <th class="text-center" width="25	%">총금액</th>
									  <td width="45%">
   										 <span id="totalAmount"><fmt:formatNumber value="${total}" type="number" /></span>원
									  </td>
									</tr>
			                      <tr>
 								 <td colspan="2" class="text-center">
                                  <c:if test="${sessionScope.userid!=null }">			
									<input type="hidden" id="userid" value="${sessionScope.userid}" />
									<a class="btn btn--e-brand-b-2" href="#" onclick="cartInsert(${vo.ino})">장바구니</a>
									<a class="btn btn--e-brand-b-2" href="../item/item_cart.do?id=${userid}">바로구매</a>
			                       </c:if>
			                       </td>
			                      </tr>	
                            	</table>                          
                            </div>
                         </div>
                        <!--====== End - Product Right Side Details ======-->
                    </div>
                </div>
            </div>
         </div>
       </div> 
        <!--====== Product Detail Tab ======-->
        <div class="u-s-p-y-90">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="pd-tab">
                            <div class="u-s-m-b-30">
                                <ul class="nav pd-tab__list">
                                    <li class="nav-item">
                                        <a class="nav-link" id="view-review" data-toggle="tab" href="#pd-review">리뷰</a>
                                    </li>
                                </ul>
                            </div>
                                <div class="tab-content">                          
									<div class="pd-tab__" id="reviewApp" data-type="1" data-no="${param.ino }">
										<jsp:include page="../commons/review.jsp"/>
									</div>
									<script src="../js/commons/page-card.js"></script>
									<script src="../js/commons/review.js"></script>
                                </div>
                              </div>
		                    </div>
		                </div>
		            </div>
		          </div>
        <!--====== End - Product Detail Tab ======-->
<script>
  document.addEventListener('DOMContentLoaded', function () {
    const rawPrice = document.getElementById('priceValue').value || "0";
    const price = parseInt(rawPrice.replace(/,/g, ''), 10);
    const quantitySelect = document.getElementById('quantitySelect');
    const totalAmount = document.getElementById('totalAmount');

    function updateTotal() {
      const quantity = parseInt(quantitySelect.value);
      const total = price * quantity;
      totalAmount.textContent = total.toLocaleString();
    }

    quantitySelect.addEventListener('change', updateTotal);
    updateTotal();
  });

  function cartInsert(ino) {
    const account = document.getElementById('quantitySelect').value;

    fetch('../item/cart_insert.do', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: new URLSearchParams({
    	ino: ino,
        account: account,
      })
    })
    .then(response => response.text())
    .then(result => {
    	console.log(result)
      if (result === 'yes') {
        alert('장바구니에 추가되었습니다!');
        location.href="../mypage/cart.do"
         } else {
        alert('에러: ' + result);
      }
    })
    .catch(error => {
      console.error('에러 발생:', error);
      alert('서버 요청 중 오류가 발생했습니다.');
    });
  }
</script>
</body>
</html>