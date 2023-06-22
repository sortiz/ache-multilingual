package achecrawler.util;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.github.pemistahl.lingua.api.*;
import static com.github.pemistahl.lingua.api.Language.*;

import achecrawler.target.model.Page;
import java.util.stream.Collectors;

public class MultilingualDetection {

    public MultilingualDetection(ArrayList<String> languages) {
        String[] langs = languages.toArray(new String[0]);
        this.languages = new ArrayList<Language>();
        
        for (String lang : langs) {
            this.languages.add(Language.valueOf(lang));
        }
        
        detector = LanguageDetectorBuilder.fromAllLanguages().withPreloadedLanguageModels().build();
 
    }
    
    private static final Logger logger = LoggerFactory.getLogger(MultilingualDetection.class);
    private static LanguageDetector detector;
    private ArrayList<Language> languages;


    /**
     * Try to detect the language of the text in the String.
     * 
     * @param content
     * @return true if the String contains English language, false otherwise
     */
    public Language isLanguage(String content) {
        try {

            if (content == null || content.isEmpty()) {
                return null;
            }
            
            Language detectedLanguage = detector.detectLanguageOf(content);
            return detectedLanguage;

        } catch (Exception ex) {
            logger.warn("Problem while detecting language in text: " + content, ex);
            return null;
        }
    }

    /**
     * Try to detect the language of contents of the page.
     * 
     * @param page
     * @return true if the page is in a valid language, false otherwise
     */
    public Boolean isValidLanguage(Page page) {
        try {
            Language langdetect = isLanguage(page.getParsedData().getCleanText());
            logger.info("Language detected is " + langdetect + " for " + page.getURL().toString());
            return languages.contains(langdetect);
        } catch (Exception e) {
            System.out.println("Exception in detect_page");
            return false;
        }
    }
    
    
    /**
     * Try to detect the language of contents of the page.
     * 
     * @param page
     * @return true if the page is in a valid language, false otherwise
     */
    public Boolean isValidLanguage(String page) {
        try {
            Language langdetect = isLanguage(page);
            logger.info("Language detected is " + langdetect);            
            return languages.contains(langdetect);
        } catch (Exception e) {
            System.out.println("Exception in detect_page");
            return false;
        }
    }

}
