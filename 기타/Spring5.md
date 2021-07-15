# Spring5



#### Dynamic Web Project to Maven Project

1. Dynamic Web Project
2. Configure > convert to maven project
3. mavenrepository.com -> Spring Context 5.3.7 Maven 클릭![image-20210607173703981](C:\Users\2-15\AppData\Roaming\Typora\typora-user-images\image-20210607173703981.png)
4. pom.xml에 해당 dependency 추가
5. Java Resources > Libraries에 라이브러리가 추가된 것을 확인할 수 있음
6. 3번의 사이트에서 mybatis dependency도 가져와 pom.xml에 추가



#### Maven Project

1. Maven Project로 프로젝트 생성

2. spring-context 선택

3. 프로젝트 골격

   ![image-20210607174943249](C:\Users\2-15\AppData\Roaming\Typora\typora-user-images\image-20210607174943249.png)

   * maven project로 생성 후, spring-context 버전을 변경하고 싶을 경우
     * spring-context에 해당하는 dependency 추가 시, 버전이 변경됨



#### 어노테이션을 사용한 주입 방법

1. AutoWired(byType)
2. byName - 의존성 주입시 객체명이 일치할 때, 주입해줌
3. byType - 객체 유형이 동일할 때, 주입
