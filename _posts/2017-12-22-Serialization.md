---
layout: post
title: "Serialization"
description: "Serialization"
categories: [Java]
tags: [Serialization]
redirect_from:
  - /2018/12/22/
---

# 직렬화

```java
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;

public class Main {

	public static void main(String[] args) throws IOException{
		// 직렬화(Serialization)
		// - 메모리에 생성된 객체(Instance)를 객체인 상태로 물리적으로 저장할 수 있는 방법.
		// - 물리적으로 직렬화된 정보를 역으로 메모리로 읽어올 수 있다. -> 역직렬화
		// - 파일에 저장하거나, 네트워크를 통해서 전송 가능.
		// - ObjectOutputStream, FileOutputStream 클래스 이용.
		// - 파일로 저장시 일반적으로 확장자는 *.ser를 사용한다.
		// - 직렬화시 고유 객체임으로 입증할 수 있는 정보 지정 필요. serialVersionUID 필드. 권장사항.
		// - 직렬화 가능 클래스로 선언된 경우만 직렬화 가능. Serializable 인터페이스 구현 필요.
		// - 객체 직렬화 대상은 필드 및 필드의 값만이다. 메소드 제외. 단, static, transient 키워드가 붙은 필드는 제외.
		// - 부모 클래스가 직렬화 가능 클래스인 경우, 자식 클래스는 자동으로 직렬화 대상이 된다. Serializable 인터페이스 구현 불필요.
		
		// Serializable 인터페이스 구현 클래스를 대상으로 직렬화 테스트
		// -> Wrapper 클래스 전체는 직렬화 지원
		
		// Integer 클래스 자료형의 객체(Instance) -> 직렬화 대상
		Integer a = new Integer(10);
		
		// 동적 파일 생성(덮어쓰기)
		FileOutputStream fs = new FileOutputStream("D:\\temt.ser");
		// 직렬화를 위한 보조스트림 준비
		ObjectOutputStream os = new ObjectOutputStream(fs);			// 객체를 저장 가능한 상태로 바꿔주는 역할
		
		// 메모리에 존재하는 객체(Instance)를 직렬화 대상으로 등록
		// -> 물리적 파일로 생성된다.
		os.writeObject(a);
				
		// 마무리
		os.close();
		fs.close();

		System.out.println("직렬화 완료^0^");
	}

}

```

# 역직렬화

```java
import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;

public class Main {

	public static void main(String[] args) throws IOException, ClassNotFoundException{
		// 직렬화(Serialization)
		// - 메모리에 생성된 객체(Instance)를 객체인 상태로 물리적으로 저장할 수 있는 방법.
		// - 물리적으로 직렬화된 정보를 역으로 메모리로 읽어올 수 있다. -> 역직렬화
		// - 파일에 저장하거나, 네트워크를 통해서 전송 가능.
		// - ObjectOutputStream, FileOutputStream 클래스 이용.
		// - 파일로 저장시 일반적으로 확장자는 *.ser를 사용한다.
		// - 직렬화시 고유 객체임으로 입증할 수 있는 정보 지정 필요. serialVersionUID 필드. 권장사항.
		// - 직렬화 가능 클래스로 선언된 경우만 직렬화 가능. Serializable 인터페이스 구현 필요.
		// - 객체 직렬화 대상은 필드 및 필드의 값만이다. 메소드 제외. 단, static, transient 키워드가 붙은 필드는 제외.
		// - 부모 클래스가 직렬화 가능 클래스인 경우, 자식 클래스는 자동으로 직렬화 대상이 된다. Serializable 인터페이스 구현 불필요.
		
		// Serializable 인터페이스 구현 클래스를 대상으로 직렬화 테스트
		// -> Wrapper 클래스 전체는 직렬화 지원
		
		// 역직렬화
		// - 물리적으로 직렬화된 정보를 역으로 메모리로 읽어올 수 있다.
		// - ObjectInputStream, FileInputStream 클래스 이용.
		
		FileInputStream fs = new FileInputStream("D:\\temt.ser");
		ObjectInputStream os = new ObjectInputStream(fs);
		
		Object temp = os.readObject();
		// 주의) 저장된 객체가 단순한 객체가 아닌 경우 형변환 등이 필요할 수 있다.
		
		// Object 클래스 자료형을 가진 변수는 접근할 수 있는 멤버가 제한적이다.
		// 객체의 정보 출력 -> toString() 메소드 호출 -> 오버라이딩 메소드 호출 가능
		System.out.println(temp);		// 객체의 정보 출력
		
	
		os.close();
		fs.close();
		
		System.out.println("역직렬화 완료^▽^");
		
	}

}
```

# 예시

```java
package com.member011;

import java.io.Serializable;

//자료형 클래스 -> 직렬화 가능클래스
public class Member implements Serializable {

	// 화면 설계를 토대로 항목 결정.
	// 회원번호(M001 형식), 이름, 전화번호, 이메일, 등록일(yyyy-MM-dd), 부서번호
	// 주의) 부서 정보는 개발부(B01), 마케팅부(B02), 총무부(B03)만 존재한다고 가정.

	private String mid, name, phone, email, regDate, deptId;

	// 기본 생성자 추가
	public Member() {
	}

	// 매개변수 목록이 있는 생성자 추가
	public Member(String mid, String name, String phone, String email, String regDate, String deptId) {
		this.mid = mid;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.regDate = regDate;
		this.deptId = deptId;
	}

	public String getMid() {
		return mid;
	}

	public String getName() {
		return name;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}

	public String getRegDate() {
		return regDate;
	}

	public String getDeptId() {
		return deptId;
	}

	// 회원 정보 출력용 메소드 추가
	@Override
	public String toString() {
		return String.format("%-5s %-10s %-15s %-20s %-12s %s", this.mid, this.name, this.phone, this.email, this.regDate,
				Dept.getValue(this.deptId));
	}

	// 회원번호 비교용 오버라이딩 메소드
	@Override
	public boolean equals(Object obj) {
		boolean result = false;
		if (obj instanceof Member) {
			Member m = (Member)obj;
			result = this.mid.equals(m.getMid());
		}
		return result;
	}

	
	
}

```



```java
package com.member011;

import java.io.*;
import java.util.*;

public class MemberDAO {

	// 컬렉션 저장소
	private List<Member> list = new ArrayList<Member>();
	private static final String FILENAME = "members.data";
	// 생성자 -> 역직렬화 시도 -> 물리적 저장된 정보를 확인한 후 메모리로 읽어들인다.
	public MemberDAO() {
		// 물리적으로 파일이 존재하는지 확인 필요
		File file = new File(FILENAME);
		if(file.exists()) {
			// 역직렬화 시도
			FileInputStream fs = null;
			ObjectInputStream os = null;
			try {
				fs = new FileInputStream(FILENAME);
				os = new ObjectInputStream(fs);
				Object temp = os.readObject();
				
				// 역직렬화 결과물을 컬렉션 저장소에 대입한다.
				this.list = (List<Member>)temp;
			} catch(IOException | ClassNotFoundException e) {
				e.printStackTrace();
				
			} finally {
				try {
					os.close();
					fs.close();
				} catch(IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	

	// 회원 정보 입력 메소드
	public void memberAdd(String name, String phone, String email, String regDate, String deptId) {

		Member max = null;
		String mid = "M001";
		if (this.list.size() > 0) {
			//기존 번호 분석 -> 저장 순서가 유지되므로 마지막 값이 가장 큰 값이다.
			max = this.list.get(this.list.size()-1);
			//신규 번호 생성 -> max 변수의 값을 분석해서 +1 연산 수행
			mid = String.format("M%03d", Integer.parseInt(max.getMid().substring(1)) + 1);
		}
		
		Member m = new Member(mid, name, phone, email, regDate, deptId);
		list.add(m);

		// 직렬화 시도
		// -> 컬렉션에 저장된 Member 객체들에 대한 물리적 저장
		// -> 주의) 같은 프로그램을 동시 실행하는 경우 A 작업자의 결과를 B 작업자의 결과가 덮어쓰기하게 된다.
		// -> 직렬화와 역직렬화를 감시하는 과정 추가 필요
		FileOutputStream fs=null;
		ObjectOutputStream os=null;
		try {
			fs = new FileOutputStream(FILENAME);
			os = new ObjectOutputStream(fs);
			
			// 컬렉션 저장소에 저장된 모든 정보를 직렬화 시도
			os.writeObject(this.list);
		} catch (IOException e) {
			e.printStackTrace();
		}  finally {
			try {
				os.close();	
				fs.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		
		}
			
		
		
	}

	// 회원 정보 출력 메소드
	public String memberList() {
		StringBuilder sb = new StringBuilder();
		
		sb.append(String.format("총: %d건%n", this.list.size()));
		sb.append(String.format("-----------------------------------------------------%n"));
		for (Member temp : this.list) {
			sb.append(String.format("%s%n", temp));
		}
		return sb.toString();
	}
	
	// 회원 정보 출력 메소드 -> 정렬 기능 지원
	public String memberList(String key) {
		StringBuilder sb = new StringBuilder();
		
		Collections.sort(list, new Comparator<Member>() {
			@Override
			public int compare(Member o1, Member o2) {
				int result = 0;
				if (key.equals("회원번호")) {
					result = o1.getMid().compareTo(o2.getMid());
				} else if (key.equals("이름")) {
					result = o1.getName().compareTo(o2.getName());
				} else if (key.equals("전화번호")) {
					result = o1.getPhone().compareTo(o2.getPhone());
				} else if (key.equals("이메일")) {
					result = o1.getEmail().compareTo(o2.getEmail());
				} else if (key.equals("등록일")) {
					result = o1.getRegDate().compareTo(o2.getRegDate());
				} else if (key.equals("부서명")) {
					result = Dept.getValue(o1.getDeptId()).compareTo(Dept.getValue(o2.getDeptId()));
				}
				return result;
			}
		});
		
		sb.append(String.format("총: %d건%n", this.list.size()));
		sb.append(String.format("-----------------------------------------------------%n"));
		for (Member temp : this.list) {
			sb.append(String.format("%s%n", temp));
		}
		return sb.toString();
	}
	
	
	// 회원 정보 검색 메소드
	public String memberSearch(String key, String value) {
		StringBuilder sb = new StringBuilder();

		int a = 0;
		for (Member m : this.list) {
			if (key.equals("회원번호") && m.getMid().equals(value)) {
				sb.append(String.format("%s%n", m));
				++a;
			} else if (key.equals("이름") && m.getName().contains(value)) {
				sb.append(String.format("%s%n", m));
				++a;
			} else if (key.equals("전화번호") && m.getPhone().contains(value)) {
				sb.append(String.format("%s%n", m));
				++a;
			} else if (key.equals("이메일") && m.getEmail().contains(value)) {
				sb.append(String.format("%s%n", m));
				++a;
			} else if (key.equals("등록일") && m.getRegDate().contains(value)) {
				sb.append(String.format("%s%n", m));
				++a;
			} else if (key.equals("부서번호") && m.getDeptId().equals(value)) {
				sb.append(String.format("%s%n", m));
				++a;
			}
		}

		if (a > 0) {
			sb.append(String.format("%s개의 결과가 있습니다.%n", a));
		} else {
			sb.append(String.format("검색 결과가 없습니다.%n"));
		}
		sb.append(String.format("---------------------%n"));

		return sb.toString();
	}
	
	
	//회원 정보 삭제
	public void memberRemove(Member m) {
		this.list.remove(m);
	}

}





```

