---
layout: post
title: "Equals method overriding code"
description: "Equals method overriding code"
categories: [Java]
tags: [equals method overriding code]
redirect_from:
  - /2017/12/13/
---

# Equals Method

### - public boolean equals(Object obj) {} 메소드는 값 비교가 아니라 참조주소를 비교한다. 이를 참조주소가 아닌, '값 비교' 메소드로 바꾸어 오버라이딩 하는 코드는 다음과 같다.

```java
@Override
	public boolean equals(Object obj) {
		boolean result = false;
		
		// obj 변수에 들어있는 자료가 Member 객체인지 확인
		if (obj instanceof Member) {
			// obj 변수에 들어있는 Member 객체를 Object 자료형에서 Member 자료형으로 형변환
			Member member = (Member) obj;
			// 외부에서 전달된 Member 객체의 name 값과 현재 객체의 name 값을 비교
			if (this.name.equals(member.getName()) && this.phone.equals(member.getPhone()) && this.email.equals(member.getEmail())) {
				// name, phone, email 값이 일치하는 경우 true 반환 준비
				result = true;
			}
		}
		return result;
	}

```


### 이를 MemberDAO 클래스의 회원 정보 입력 메소드에서 적용하면....

```java
// 회원 정보 입력 메소드
	public void memberAdd(String name, String phone, String email, String regDate) throws DuplicatedException {
		// Member 객체 생성 및 (배열)저장소에 저장
		Member m = new Member(name, phone, email, regDate);
		
		// 문제) 외부에서 전달된 자료를 가지고 만든 Member 객체와
		// (배열) 저장소에 저장된 Member 객체에 대한 비교 진행
		// -> 동일 객체 발견시 사용자 정의 예외 발생
		for(int i=0; i<members.length; ++i) {
			if(m.equals(members[i])) {
				throw new DuplicatedException("입력에 실패했습니다. 중복된 값이 존재합니다.");
			}
		}
		
		this.members[this.idx] = m;
		// 인덱스 증가
		++this.idx;
		if(idx%5==0) {
			members = Arrays.copyOf(members, members.length+5);
		}
	}
```
### MemberService에서는 다음과 같이 try~catch로 처리

```java
	try {
			// 회원 정보 입력 메소드 호출
			this.dao.memberAdd(name, phone, email, regDate);
			// 메시지 출력
			System.out.println("회원 정보 입력이 성공했습니다");
		} catch (DuplicatedException e) {
			System.out.println(e.getMessage());
		}
	}
```

