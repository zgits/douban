package com.ssh.util;

import com.ssh.model.Movie;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/12/30.
 */
public class MovieByDate {

    public static void ListSort(List<Movie> list) {

        Collections.sort(list, new Comparator<Movie>() {

            @Override
            public int compare(Movie o1, Movie o2) {
                 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                 try {
                     Date dt1 = o1.getRelease_time();
                     Date dt2 = o1.getRelease_time();
                     if (o1.getRelease_time().after(o1.getRelease_time())) {
                         return 1;

                    } else if (o1.getRelease_time().before(o1.getRelease_time())) {
                         return -1;

                    } else {
                         return 0;

                    }

                } catch (Exception e) {
                     e.printStackTrace();

                }
                 return 0;
            }

        });

    }
}
