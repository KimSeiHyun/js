<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            margin: 0px;
        }
        .wrap {
            height: 100vh;
            display: grid;
            grid-template-columns: 1fr 450px 1fr;
            grid-template-rows: 150px auto 50px;
            grid-template-areas:
                "header header header"
                "aside1 main aside2"
                "aside1 footer aside2"
            ;
        }

        .logo {
            display: block;
            width: 240px;
            height: 44px;
            margin: 50px auto 100px;
            background-image: url(https://static.nid.naver.com/images/ui/join/m_naver_logo_20191126.png);
            background-size: 240px auto;
            font-size: 0;
        }


        header {
            grid-area: header;
            background-color: rgb(231, 231, 231);
        }

        main {
            grid-area: main;
            background-color: rgb(231, 231, 231);
        }

        footer {
            grid-area: footer;
            background-color: rgb(231, 231, 231);
        }

        .aside1 {
            grid-area: aside1;
            background-color: rgb(231, 231, 231);
        }

        .aside2 {
            grid-area: aside2;
            background-color: rgb(231, 231, 231);
    
        }

        .checkAll , .checkCompulsory1,.checkCompulsory2 , .checkOption1,.checkOption2{
            display: none;
        }

        .label1 , .label2 , .label3 , .label4 , .label5 {
            padding-left: 30px;
            background-repeat: no-repeat;
            background: #f5f6f7 url(https://static.nid.naver.com/images/ui/myinfo/pc_check_off_24.png) no-repeat 0 0;
            background-size: 20px 20px;
            cursor: pointer;
            background-color: rgb(231, 231, 231);
        }
        .checkAll:checked+ .label1 {
            background: #f5f6f7 url(https://static.nid.naver.com/images/ui/myinfo/pc_check_on_l_24.png) no-repeat 0 0;
            background-color: rgb(231, 231, 231);
            background-size: 20px 20px;
        }

        .checkCompulsory1:checked+ .label2 {
            background: #f5f6f7 url(https://static.nid.naver.com/images/ui/myinfo/pc_check_on_l_24.png) no-repeat 0 0;
            background-color: rgb(231, 231, 231);
            background-size: 20px 20px;
        }
        .checkCompulsory2:checked+ .label3 {
            background: #f5f6f7 url(https://static.nid.naver.com/images/ui/myinfo/pc_check_on_l_24.png) no-repeat 0 0;
            background-color: rgb(231, 231, 231);
            background-size: 20px 20px;
        }
        .checkOption1:checked+ .label4 {
            background: #f5f6f7 url(https://static.nid.naver.com/images/ui/myinfo/pc_check_on_l_24.png) no-repeat 0 0;
            background-color: rgb(231, 231, 231);
            background-size: 20px 20px;
        }
        .checkOption2:checked+ .label5 {
            background: #f5f6f7 url(https://static.nid.naver.com/images/ui/myinfo/pc_check_on_l_24.png) no-repeat 0 0;
            background-color: rgb(231, 231, 231);
            background-size: 20px 20px;
        }

        .check_all_text {
            font-size: 15px;
            font-weight: 900;
            text-decoration: underline;
        }

        .check_text {
            font-size: 14px;
            font-weight: 700;
        }
        #compulsory {
            font-size: 13px;
            font-weight: 300;
            color: rgb(53, 175, 106);
        }
        #option {
            font-size: 13px;
            font-weight: 300;
            color: rgb(128, 128, 128);
        }

        .div_checkAll {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 30px;
        }
        .div_check1 , .div_check2 , .div_check3 , .div_check4{
            height: 20px;
            margin-bottom: 10px;
        }
        .div_box1 , .div_box2 , .div_box3{
            overflow: auto;
            height: 80px;
            background-color: white;
            border: solid 1px;
            border-color: rgb(150, 150, 150);
            margin-bottom: 25px;
        }
        .error {
            display : none;
            font-size: 11px;
            color: red;
        }
        a{
            color: yellowgreen;
        }
        h3 {
            padding: 0 12px 0 12px;
            font-size: 13px;
            color: rgb(61, 61, 61);
        }
        p {
            padding: 0 12px 0 12px;
            font-size: 12px;
        }

    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>Document</title>
</head>

<body>
    <form action="_2_join.jsp">
        <div class="wrap">
            <header>
                <a href="https://www.naver.com/" class="logo">naver</a>
            </header>
            <main>
                <div class="div_checkAll">
                    <input type="checkbox" class="checkAll" id="check_all"><label for="check_all" class="label1"><span
                        class="check_all_text">네이버 이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 정보 수신(선택)에 모두
                        동의합니다.</span></label>
                    </div>
                    <div class="div_check1">
                        <input type="checkbox" class="checkCompulsory1" id="check_compulsory1" name="checkBox"><label for="check_compulsory1"
                        class="label2"><span class="check_text">네이버 이용약관 동의<span id="compulsory">(필수)</span></span></label>
                    </div>
                    <div class="div_box1">
                        <div class="box1_1">
                            <h3 class="box_title">여러분을 환영합니다.</h3>
                            <p>네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하
                                ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를
                                포함하고 있습니다.</p>
                                <p>네이버 서비스를 이용하시거나 네이버 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐
                                    주시기 바랍니다.</p>
                                </div>
                                <div class="box1_2">
                                    <h3 class="box_title">다양한 네이버 서비스를 즐겨보세요.</h3>
                                    <p>네이버는<a href="https://www.naver.com/">www.naver.com</a>을 비롯한 네이버 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱)을 통해
                                        정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 제공, 상품 쇼핑 등 여러분의 생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고 있습니다.<br>여러분은 PC,
                                        휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의 네이버 서비스를 자유롭게 이용하실 수 있으며, 개별 서비스들의 구체적인 내용은 각 서비스 상의 안내,
                                        공지사항,<a href="https://help.naver.com/support/home.help">네이버 웹고객센터(이하'고객센터')</a>도움말 등에서 쉽게 확인하실 수
                                        있습니다.</p>
                                        <p></p>
                                    </div>
                                </div>
                                <div class="div_check2">
                                    <input type="checkbox" class="checkCompulsory2" id="check_compulsory2" name="checkBox"><label for="check_compulsory2"
                                    class="label3"><span class="check_text">개인정보 수집 및 이용 동의<span id="compulsory">(필수)</span></span></label>
                                    <a href="https://nid.naver.com/user2/V2Join?m=kidGuide"><span>어린이용 안내</span></a>
                                </div>
                                <div class="div_box2">
                                    <div class="box2_1">
                                        <p>개인정보보호법에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</p>
                                    </div>
                                    <div class="box2_2">
                                        <h3>1. 수집하는 개인정보</h3>
                                        <p>이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.</p>
                                    </div>
                                </div>
                                
                                <div class="div_check3">
                                    <input type="checkbox" class="checkOption1" id="check_Option1" name="checkBox"><label for="check_Option1"
                                    class="label4"><span class="check_text">위치정보 이용약관 동의<span id="option">(선택)</span></span></label>
                                </div>
                                
                                <div class="div_box3">
                                    <div class="box3_1">
                                        <p>위치정보 이용약관에 동의하시면, <strong>위치를 활용한 광고 정보 수신 </strong>등을 포함하는 네이버 위치기반 서비스를 이용할 수 있습니다.</p>
                                    </div>
                                    <div class="box3_2">
                                        <h3>제 1조 (목적)</h3>
                                        <p>이 약관은 네이버 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는 위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
                                        <h3>제 2조 (약관 외 준칙)</h3>
                                        <p>이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보처리방침, 회사가 별도로 정한 지침 등에 의합니다.</p>
                                    </div>
                                </div>
                                
                                <div class="div_check4">
                                    <input type="checkbox" class="checkOption2" id="check_Option2" name="checkBox"><label for="check_Option2"
                                    class="label5"><span class="check_text">프로모션 정보 수신 동의<span id="option">(선택)</span></span></label>
                                </div>
                                <p>
                                    네이버에서 제공하는 이벤트/혜택 등 다양한 정보를 휴대전화(네이버앱 알림 또는 문자), 이메일로 받아보실 수 있습니다. 일부 서비스(별도 회원 체계로 운영하거나 네이버 가입 이후 추가 가입하여 이용하는 서비스 등)의 경우, 개별 서비스에 대해 별도 수신 동의를 받을 수 있으며, 이때에도 수신 동의에 대해 별도로 안내하고 동의를 받습니다.
                                </p>
            <span class="error">네이버 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.</span>
            <div class="calcelConfirm">
				    <input type="button" value="취소" onclick="back()">
                    <input type="button" value="확인" onclick="checkBoxs(form)">
            </div>
        </main>
        <aside class="aside1"></aside>
        <aside class="aside2"></aside>
        <footer></footer>
    </div>
    </form>
    <script>
    	function back() {
    		location.href = "https://www.naver.com/";
    	}
    	function checkBoxs(form) {
    			if(form.checkBox[0].checked === true &&form.checkBox[1].checked === true  ) {
    				form.submit();
    			}else {
    				const a = document.querySelector('.error');
                    a.style.display = "block";
    			}

    	}

         $( document ).ready( function() {
            $( '.checkAll' ).click( function() {
                $( 'input' ).prop( 'checked', this.checked );
            });
         });
    </script>
</body>

</html>