package achecrawler.util;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.ArrayList; 

import static org.assertj.core.api.Assertions.assertThat;

class LangDetectionTest {
    
    static MultilingualDetection langDetect;

    @BeforeAll
    static  void setUpClass() {
		ArrayList<String> languages = new ArrayList<String>();
		languages.add("SPANISH");
		languages.add("GALICIAN");
        langDetect = new MultilingualDetection(languages);
//        langDetect.init("libs/profiles/");
    }

    @Test
    void shouldDetectEnglishLanguage() {
        // given
        String textInEnglish = "This text is written in plain regular english language";
        
        // when
        Boolean isEnglish = langDetect.isValidLanguage(textInEnglish);
        
        // then
        assertThat(isEnglish).isTrue();
    }

    @Test
    void shouldDetectWhenTextIsNotEnglishLanguage() {
        // given
        String textNotInEnglish = "Este texto está escrito em lingua portuguesa.";
        
        // when
        Boolean isEnglish = langDetect.isValidLanguage(textNotInEnglish);
        
        // then
        assertThat(isEnglish).isFalse();
    }

    @Test
    void shouldReturnFalseForNull() {
        // given
        String textNotInEnglish = null;
        
        // when
        Boolean isEnglish = langDetect.isValidLanguage(textNotInEnglish);
        
        // then
        assertThat(isEnglish).isFalse();
    }

    @Test
    void shouldReturnFalseForEmptyString() {
        // given
        String textNotInEnglish = "";
        
        // when
        Boolean isEnglish = langDetect.isValidLanguage(textNotInEnglish);
        
        // then
        assertThat(isEnglish).isFalse();
    }


}